# encoding UTF-8
require_relative 'dados'
require_relative 'testemunha'

# Classe que define a tentativa (teoria)
# exibe os possíveis suspeitos, locais e armas
# recebe a tentativa nesta mesma ordem
# e retorna 0 caso esteja correta ou 
# 1 - para suspeito incorreto,
# 2 - para local incorreto,
# 3 - para arma incorreta.
class Teoria
  include Dados
  include Testemunha
  
  def initialize(suspeito, local, armas)
    @suspeito = suspeito
    @local = local
    @armas = armas
    @resposta = []
    @resultado = []
  end
  
  # Se @suspeito, @local ou @armas
  # estiverem errados, então serão
  # adicionados 1, 2 ou 3 à @resposta.
  def monta_resposta
    @resposta.push(1) if CRIME[0] != @suspeito
    @resposta.push(2) if CRIME[1] != @local
    @resposta.push(3) if CRIME[2] != @armas
    return @resposta
  end

  # Para cada categoria mapeada evoca
  # o metodo exibe_possibilidades que
  # exibe todas as opções diponíveis 
  # para a categoria.
  def varre_possibilidades(categoria)
    case categoria.upcase
    when 'SUSPEITOS'
      exibe_possibilidades(Dados::SUSPEITOS)
    when 'LOCAIS'
      exibe_possibilidades(Dados::LOCAIS)
    when 'ARMAS'
      exibe_possibilidades(Dados::ARMAS)
    else
      raise "Categoria: #{categoria} desconhecida." 
    end      
  end

  # Percorre e exibe na tela o indice
  # e o valor da categoria selecionada.
  def exibe_possibilidades(categoria)
    categoria.each_with_index {|value, index| puts "#{index})#{value}"}
  end

  # Verifica se a @resposta contém 1, 2 ou 3
  # caso não contenha significa que a tentiva
  # está correta, caso contrário retorna
  # algum deles para indicar um categoria
  # que teve o item escolhido, errado.
  def pergunta_testemunha
    monta_resposta
    unless @resposta.any? {|item| [1, 2, 3].include? item}
      @resultado.push(0)
    else
      @resultado.push(@resposta.sample)
    end

    return @resultado
  end
end
