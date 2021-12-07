# frozen_string_literal: true

class UpdatePackagesListJob < ApplicationJob
  queue_as :urgent

  def perform
    Cran::Packages.fetch
    Cran::PackageList.with_description
  end
end
