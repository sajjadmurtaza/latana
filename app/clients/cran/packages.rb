# frozen_string_literal: true

require 'open-uri'
require 'zlib'

module Cran
  class Packages
    def self.fetch
      URI.open('packages.tar', 'wb') do |local_file|
        URI.open('http://cran.r-project.org/src/contrib/PACKAGES.gz') do |remote_file|
          file = Zlib::GzipReader.new(remote_file).read

          local_file.write(file)
        end
      end
    end
  end
end
