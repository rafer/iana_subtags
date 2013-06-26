#!/usr/bin/env ruby

require "subtag"

Subtag.by_type.each do |type, subtags|
  puts "#{type}: #{subtags.size}"
end

p Subtag.find { |s| s.value == "abc" } # => Type: "language", Subtag: "abc", Description: "Ambala Ayta"
p Subtag.find { |s| s.value == "CD" } # => Type: "region", Subtag: "CD", Description: "The Democratic Republic of the Congo"
