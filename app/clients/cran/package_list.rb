# frozen_string_literal: true

require 'open-uri'
require 'rubygems/package'
require 'zlib'

module Cran
  class PackageList
    def self.with_description
      packages = DebControl::ControlFileBase.read 'packages.tar'

      packages.paragraphs.each do |pkg|
        pkg_name = pkg['Package']
        pkg_version = pkg['Version']

        pkg_name_with_version = "#{pkg_name}_#{pkg_version}"

        URI.open("#{pkg_name_with_version}.tar", 'wb') do |local_file|
          URI.open("http://cran.r-project.org/src/contrib/#{pkg_name_with_version}.tar.gz") do |remote_file|
            pkg_extract = Gem::Package::TarReader.new(Zlib::GzipReader.open(remote_file))
            pkg_extract.rewind

            pkg_extract.each do |entry|
              if entry.full_name == "#{pkg['Package']}/DESCRIPTION"
                file = entry.read
                local_file.write(file)
              end
            end
          end
        end

        package_description = DebControl::ControlFileBase.read "#{pkg_name_with_version}.tar"

        package_description.paragraphs.each do |pkg|
          package = Package.find_or_initialize_by(name: pkg['Package'], version: pkg['Version'])
          package.description = pkg
          package.save
        end

        File.delete("#{pkg_name_with_version}.tar") if File.exist?("#{pkg_name_with_version}.tar")

      rescue StandardError
        File.delete("#{pkg_name_with_version}.tar") if File.exist?("#{pkg_name_with_version}.tar")
        next
      end
    end
  end
end
