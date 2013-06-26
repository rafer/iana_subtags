require "pathname"

class Subtag
  extend Enumerable

  def self.all
    @all ||= Pathname.new("language-subtag-registry").
      read.split("%%").drop(1).map { |r| new(r) }
  end

  def self.by_type
    @by_type ||= all.group_by(&:type)
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

  def description
    field("Description")
  end

  def value
    field("Subtag")
  end

  def inspect
    "Type: #{type.inspect}, Subtag: #{value.inspect}, Description: #{description.inspect}"
  end
end
