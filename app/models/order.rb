#!/bin/env ruby
# encoding: utf-8
class Order < ActiveRecord::Base
  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
  attr_accessible :address, :email, :name, :pay_type
  has_many :line_items, dependent: :destroy

  validates :name, :address, :email, presence:true
  validates :pay_type, inclusion: PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
        item.cart_id = nil # иначе товарная позиция исчезнет после удаления корзины
        line_items << item
    end
  end
end
