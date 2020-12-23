class CreateCandidateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :candidate_details do |t|
      t.string :first
      t.string :last
      t.string :email
      t.bigint :phone
      t.string :degree
      t.float :percentage
      t.float :experience
      t.string :platform
      t.string :filename

      t.timestamps
    end
    add_index :candidate_details, :email, unique: true
  end
end
