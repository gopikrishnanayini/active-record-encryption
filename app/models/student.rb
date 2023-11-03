class Student < ApplicationRecord
	encrypts :name, :age, :class_name, :address, deterministic: true
end
