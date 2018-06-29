class HomeController < ApplicationController
  def index
    @traducoes = []
    @traducoes << Card.new("Cachorro", "Dog")
    @traducoes << Card.new("Gato", "Cat")
  end
end
