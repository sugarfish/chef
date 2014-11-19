name "hso"
description "the hso chef role"
run_list "recipe[hso]"

override_attributes({
  "starter_name" => "Ian Atkin",
})
