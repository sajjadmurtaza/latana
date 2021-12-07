# frozen_string_literal: true

namespace :db do
  desc 'Update packages list'
  task update_packages_list: :environment do
    Cran::Packages.fetch
    Cran::PackageList.with_description

    p '===== Done ====='
  end
end
