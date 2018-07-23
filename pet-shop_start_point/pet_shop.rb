def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, number)
  pet_shop[:admin][:pets_sold] += number
end

def stock_count(pet_shop)
  return pet_shop[:pets].length()
end

def pets_by_breed(pet_shop, breed)
  pets = []

  for pet in pet_shop[:pets]
    pets << pet[:name] if pet[:breed] == breed
  end

  return pets
end

# def find_pet_by_name(pet_shop, name)
#   for pet in pet_shop[:pets]
#     return pet if pet[:name] == name
#   end
#   return nil #if I don't have this line it returns the whole pets array if the pet doesn't exist?
# end

def find_pet_by_name(pet_shop, name)
  pet_shop[:pets].each do |pet|
    return pet if pet[:name] == name
  end
  return nil #if I don't have this line it returns the whole pets array if the pet doesn't exist?
end

def remove_pet_by_name(pet_shop, name)
  #initial try to find appropriate index of pet_shop[:pets] array:
  # idx = 0
  #
  # while idx < pet_shop[:pets].length()
  #   break if pet_shop[:pets][idx][:name] == name
  #   idx += 1
  # end
  #

  #found a shorter way using a block:
  #idx = pet_shop[:pets].index{|pet| pet[:name] == name}

  #delete entry from pet_shop[:pets] array
  #pet_shop[:pets].delete_at(idx)

  pet = find_pet_by_name(pet_shop, name)
  pet_shop[:pets].delete(pet)

end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets] << new_pet
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].length()
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet != nil && customer_can_afford_pet(customer, pet)
    add_pet_to_customer(customer, pet)
    increase_pets_sold(pet_shop, 1)
    remove_customer_cash(customer, pet[:price])
    add_or_remove_cash(pet_shop, pet[:price])
  end
end
