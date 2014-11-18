name "hso"
description "the hso chef role"
run_list "recipe[nginx]",
	 "recipe[php-fpm]"

override_attributes({
  "starter_name" => "Ian Atkin",
})
