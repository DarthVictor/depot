#!/bin/env ruby
# encoding: utf-8
class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  attr_accessible :cart_id, :product_id, :price

  def total_price
        price * quantity
  end
end