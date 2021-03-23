class ImportMunicipalDatakeys < ActiveRecord::Migration[6.1]
  def change
    create_table :ma_municipal_data_keys do |t|
      t.integer :muni_id
      t.string :municipal
      t.integer :mapc
      t.integer :mf164
      t.integer :county_id
      t.string :county
      t.integer :comm_type
      t.string :comm_name
      t.integer :subtype_id
      t.string :subtype
      t.integer :rpa_id
      t.string :rpa_name
      t.integer :mpo_id
      t.string :mpo_name
      t.integer :region_id
      t.string :region
      t.integer :subreg_id
      t.string :subregion
      t.integer :cousub_id
      t.string :cousub_name
    end
    
    csv_text = File.read(Rails.root.join('lib', 'import', 'tabular._datakeys_muni351.csv'))
    csv = ::CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
    csv.each do |row|
      Municipality.create(
        muni_id: row['muni_id'],
        municipal: row['municipal'],
        mapc: row['mapc'],
        mf164: row['mf164'],
        county_id: row['county_id'],
        county: row['county'],
        comm_type: row['comm_type'],
        comm_name: row['comm_name'],
        subtype_id: row['subtype_id'],
        subtype: row['subtype'],
        rpa_id: row['rpa_id'],
        rpa_name: row['rpa_name'],
        mpo_id: row['mpo_id'],
        mpo_name: row['mpo_name'],
        region_id: row['region_id'],
        region: row['region'],
        subreg_id: row['subreg_id'],
        subregion: row['subregion'],
        cousub_id: row['cousub_id'],
        cousub_name: row['cousubname']
      )
    end
  end
end
