#!/usr/bin/env ruby

log_entry = ARGV[0]

from_pattern = /\[from:(.+?)\]/
to_pattern = /\[to:(.+?)\]/
flags_pattern = /\[flags:(.+?)\]/

from = log_entry.match(from_pattern)[1]
to = log_entry.match(to_pattern)[1]
flags = log_entry.match(flags_pattern)[1]

puts "#{from},#{to},#{flags}"

