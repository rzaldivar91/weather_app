class CreateWeathers < ActiveRecord::Migration[8.1]
  def change
    create_table :weathers do |t|
      t.timestamps
    end
  end
end
