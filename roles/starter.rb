name "starter"
description "An example Chef role"
run_list "recipe[learn_chef_apache2]"

override_attributes({
  "starter_name" => "Ian Atkin",
})
