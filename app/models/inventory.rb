class Inventory < ActiveRecord::Base

	before_create :create
	before_update :update
	before_delete :delete

	protected
	def create
		Inventories.id = Products.id
		Inventories.product_id = Products.product_id
		Inventories.previous_balance = 0 
		Inventories.new_balance = Products.amount 
		Inventories.future_balance = Products.amount + Products.projection 
	end
	def update
		Inventories.previous_balance = Products.new_balance 
		Inventories.new_balance = Products.amount 
		Inventories.future_balance = Products.amount + product.projection
	end
	def delete
		registro = Inventories.find_by_product_id(id)
		registro.each do |r|
		r.delete
	end
end
