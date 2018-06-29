# CORRIGIR LOOP DE MENU SECUNDÁRIO
# REFATORAR
# INCLUIR VERIFICAÇÃO DE CARD DUPLICADO NA CRIAÇÃO

INSERIR_CARD = 1
EXIBIR_CARD = 2
REDEFINIR_CARD = 3
BUSCAR_CARD = 4
BUSCA_PORTUGUES = "A"
BUSCA_INGLES = "B"
RETORNAR_MENU = "C"
SAIR = 5

# Boas vindas
puts
puts "Bem vindo ao Cards System!"

require_relative 'card'

# Método de menu inicial
def menu
  puts
  puts "** MENU **"
  puts "Digite a opcao desejada"
  puts "[#{INSERIR_CARD}] Inserir um novo card"
  puts "[#{EXIBIR_CARD}] Exibir todos os cards"
  puts "[#{REDEFINIR_CARD}] Redefinir card"
  puts "[#{BUSCAR_CARD}] Buscar um card"
  puts "[#{SAIR}] Sair"
  puts
  print "Escolha uma opcao: "
  opcao = gets.to_i
  return opcao
end

# Método de menu de busca
def menu_secundario
  puts "Selecione opcao para alteracao:"
  puts "[#{BUSCA_PORTUGUES}] Portugues"
  puts "[#{BUSCA_INGLES}] Ingles"
  puts "[#{RETORNAR_MENU}] Retornar menu anterior"
  puts
  print "Insira qual opcao de texto: "
  tipo_i = gets.chomp.upcase
  return tipo_i
end

# Método de impressão de cards
def imprime_cards(cards)
  cards.each do |card|
    puts card
  end
end

# Método para validação de quantidade no array de cards
def valida_array_cards(cards)

  if(cards.count > 0)
    puts "Cards:"
    imprime_cards(cards)
    return true
  else
    puts "Sem cards inseridos!"
    return false
  end

end

# Mérodo de busca de card por id
def busca_id(cards, id)
  cards.each do |cartao|

    if cartao.id == id.to_i
      card = cartao
    else
      card = false
    end

    return card
  end
end

# Método de busca de card por texto
def busca_texto(tipo, cards, texto)
  total = []
  cards.each do |cartao|

    if (cartao.portugues.upcase.include? texto) && (tipo == "Portugues")
      total << cartao
    elsif (cartao.ingles.upcase.include? texto) && (tipo == "Ingles")
      total << cartao
    end

  end

  return total
end

# INÍCIO
puts
opcao_escolhida = menu

cartao_id = 1
cartoes = []

# Loop de menu principal
while(opcao_escolhida != SAIR) do

  # Inserindo card
  if(opcao_escolhida == INSERIR_CARD)

    print "Insira uma expressao em Portugues: "
    portugues = gets.chomp
    print "Insira uma expressao em Ingles: "
    ingles = gets.chomp
    puts

    # Cria card do tipo da classe do arquivo "card.rb"
    cartao = Card.new(cartao_id, portugues, ingles)
    cartoes << cartao
    puts "Card inserido com sucesso!"
    cartao_id = cartao_id + 1

  # Exibe todos os cards criados se houver
  elsif(opcao_escolhida == EXIBIR_CARD)
    puts
    validado = valida_array_cards(cartoes)

  # Lista opção para redefinir cards se houver
  elsif(opcao_escolhida == REDEFINIR_CARD)
    puts
    validado = valida_array_cards(cartoes)

    if validado == true
      puts
      opcao_texto = menu_secundario

      if(opcao_texto == BUSCA_PORTUGUES)
        print "Insira ID do card: "
        id = gets.chomp
        cartao = busca_id(cartoes, id)
        print "Insira novo texto em Portugues: "
        novo_texto = gets.chomp
        cartao.alterar("Portugues", novo_texto)
        puts "Card Alterado!"
        puts cartao
      elsif(opcao_texto == BUSCA_INGLES)
        print "Insira ID do card: "
        id = gets.chomp
        cartao = busca_id(cartoes, id)
        print "Insira novo texto em Ingles: "
        novo_texto = gets.chomp
        cartao.alterar("Ingles", novo_texto)
        puts "Card Alterado!"
        puts cartao
      end

    end

  # Lista opçao de busca de cards se houver
  elsif(opcao_escolhida == BUSCAR_CARD)
    puts
    validado = valida_array_cards(cartoes)

    if validado == true
      puts
      opcao_texto = menu_secundario

      if(opcao_texto == BUSCA_PORTUGUES)
        print "Digite texto para busca: "
        texto_busca = gets.chomp.upcase
        encontrados = busca_texto("Portugues", cartoes, texto_busca)
        puts "Total de cards encontrados: #{encontrados.count}"
        imprime_cards(encontrados)
      elsif(opcao_texto == BUSCA_INGLES)
        print "Digite texto para busca: "
        texto_busca = gets.chomp.upcase
        puts "Total de cards encontrados: #{encontrados.count}"
        encontrados = busca_texto("Ingles", cartoes, texto_busca)
        imprime_cards(encontrados)
      end

    end

  else

    puts "Opcao escolhida invalida!"
    puts

  end
  opcao_escolhida = menu
end
puts
puts "Obrigado por utilizar o Cards System!"
puts
