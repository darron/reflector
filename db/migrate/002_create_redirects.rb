migration 2, :create_redirects do
  up do
    create_table :redirects do
      column :id, Integer, :serial => true
      column :title, String, :length => 255
      column :url, String, :length => 255
    end
  end

  down do
    drop_table :redirects
  end
end
