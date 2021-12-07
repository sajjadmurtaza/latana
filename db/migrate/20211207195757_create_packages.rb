# frozen_string_literal: true

class CreatePackages < ActiveRecord::Migration[7.0]
  def change
    create_table :packages do |t|
      t.string :name
      t.string :version
      t.json :description

      t.timestamps
    end
  end
end
