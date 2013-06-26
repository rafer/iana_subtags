#!/usr/bin/env ruby

require "pathname"

class Subtag
  extend Enumerable

  def self.all
    Pathname.new("language-subtag-registry").
      read.split("%%").map { |r| new(r) }.
      drop(2).
      reject { |s| s.value.nil? }.
      reject { |s| s.type == "extlang" }
  end

  def self.each(&block)
    all.each(&block)
  end

  def initialize(raw)
    @lines = raw.each_line
  end

  def field(name)
    line = @lines.find{ |l| l.start_with?("#{name}: ") }
    line.gsub("#{name}: ", "").chomp if line
  end

  def type
    field("Type")
  end

  def value
    field("Subtag")
  end

  def inspect
    "Type: #{type}, Subtag: #{value}"
  end
end

p Subtag.first