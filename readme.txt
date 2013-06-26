Code to easily explore the IANA Language Subtag registry with Ruby.

The IANA Langauge Subtag registry defines all of the legal values for IETF language tags. It contains things like languages, regions and scripts.

http://en.wikipedia.org/wiki/IETF_language_tag

Subtag count by type?

    Subtag.by_type.each do |type, subtags|
      puts "#{type}: #{subtags.size}"
    end

Lookup by subtag?

    p Subtag.find { |s| s.value == "abc" }
    # => Type: "language", Subtag: "abc", Description: "Ambala Ayta"

    p Subtag.find { |s| s.value == "CD" }
    # => Type: "region", Subtag: "CD", Description: "The Democratic Republic of the Congo"

This repo includes the database. Update it with ./update_db
