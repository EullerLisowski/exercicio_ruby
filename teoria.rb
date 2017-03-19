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
  include DADOS
  include TESTEMUNHA
  
  def initialize(suspeito, local, armas)
    @suspeito = suspeito
    @local = local
    @armas = armas
    @resposta = []
    @resultado = []
  end
  
  private
  def monta_resposta
    @resposta.push(1) if CRIME[0] != @suspeito
    @resposta.push(2) if CRIME[1] != @local
    @resposta.push(3) if CRIME[2] != @armas
    return @resposta
  end

  public
  def pergunta_testemunha
    monta_resposta
    unless (@resposta.include? (1 or 2 or 3))
      @resultado.push(0)
    else
      @resultado.push(@resposta.sample)
    end

    return @resultado
  end
end
