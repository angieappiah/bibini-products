

ActiveRecord::Schema.define(version: 20200617210829) do

  create_table "products", force: :cascade do |t|
    t.string  "title"
    t.string  "description"
    t.string  "price"
    t.integer "user_id"
    t.string  "image"
  end

  create_table "reviews", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end
