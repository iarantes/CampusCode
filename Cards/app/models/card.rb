class Card < ApplicationRecord
  # attr_reader :id
  attr_accessor :portugues, :ingles

  def initialize(id, portugues, ingles)
    # @id = id
    @portugues = portugues
    @ingles = ingles
  end

#   def to_s()
#     puts "ID: #{id} => Portugues: #{portugues} | Ingles: #{ingles}"
#   end

  def imprimir
    "Card #{portugues()} => #{ingles()}"
  end

#   def alterar(tipo, texto)
#     if(tipo == "Portugues")
#       @portugues = texto
#     elsif(tipo == "Ingles")
#       @ingles = texto
#     end
#   end

end
