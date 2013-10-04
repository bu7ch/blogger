class Article < ActiveRecord::Base
		has_many :comments
		has_many :taggings
		has_many :tags, through: :taggings
		has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
		attr_reader :tag_list
	def tag_list=(tags_string)

  		tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq

  		new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
  		self.tags = new_or_found_tags
	end

  	def article_params
    	params.require(:article).permit(:title, :body, :tag_list, :image)
  	end
  	
end

