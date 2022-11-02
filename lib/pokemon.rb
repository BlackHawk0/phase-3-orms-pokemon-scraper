
class Pokemon
  attr_reader :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type 
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    self
  end

  def self.find(id, db)
    results = db.execute("SELECT * FROM pokemon WHERE id = ?", [id]).first
    Pokemon.new(id: results[0], name: results[1], type: results[2], db: db)
  end
end
