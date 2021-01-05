class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods
  has_many :reservations, through: :listings

  def city_openings( date_start, date_end )
    # @listings = Listing.all.where()
  end

  def self.highest_ratio_res_to_listings
    compare = 0
    result = nil
    City.all.includes(:reservations).each do |city|
      if city.listings.size > 0 && city.reservations.size > 0
        ratio = city.reservations.size / city.listings.size
        if ratio > compare
          compare = ratio
          result = city
        end
      end
    end
    result
  end

  def self.most_res
    compare = 0
    result = nil
    City.all.includes(:reservations).each do |city|
      if city.reservations.size > 0 && city.reservations.size > compare
        compare = city.reservations.size
        result = city
      end
    end
    result
  end
end

