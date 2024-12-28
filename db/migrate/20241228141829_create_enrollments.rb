class CreateEnrollments < ActiveRecord::Migration[8.0]
  def change
    create_table :enrollments do |t|
      t.belongs_to :user
      t.belongs_to :course
      t.string :status
      t.timestamps
    end
  end
end
