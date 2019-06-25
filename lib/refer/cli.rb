require "optparse"

module Refer
  class Cli
    def initialize(argv)
      @options = {}
      OptionParser.new { |opts|
        # TODO: have options
      }.parse!(argv, into: @options)
      @files = argv.empty? ? Dir["**/*.rb"] : argv
    end

    def call
      result = Runner.new.call(
        files: @files
      )

      (result.definitions + result.references).each do |d|
        puts "#{d.file}:#{d.line}:#{d.column}: #{d.full_name} (#{d.type_name})"
      end

      0
    end
  end
end
