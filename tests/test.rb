require_relative '../teoria'
require 'test/unit'

class TeoriaTest < Test::Unit::TestCase
  def set_up(suspeito=0, local=0, armas=0)
    teoria = Teoria.new(suspeito,
                        local,
                        armas)
    return teoria
  end

  def test_all_wrong_return
    teoria = set_up(1, 1, 1) 
    assert teoria.pergunta_testemunha.any? {|item| [1, 2, 3].include? item}
  end

  def test_all_correct_return
    teoria = set_up(4, 5, 7)
    assert teoria.pergunta_testemunha == [0]
  end

  def test_display_suspects_options
    teoria = set_up
    assert teoria.varre_possibilidades('SUSPEITOS') == 
      '0)Charles B. Abbage'\
      '1)Donald Duck Knuth'\
      '2)Ada L. Ovelace'\
      '3)Alan T. Uring'\
      '4)Ivar J. Acobson'\
      '5)Ras Mus Ler Dorf'\
  end
  
  def test_display_locals_options
    teoria = set_up
    assert teoria.varre_possibilidades('LOCAIS') == 
      '0)Redmond'\
      '1)Palo Alto'\
      '2)San Francisco'\
      '3)Tokio'\
      '4)Restaurante no Fim do Universo'\
      '5)São Paulo'\
      '6)Cupertino'\
      '7)Helsinki'\
      '8)Maida Vale'\
      '9)Toronto'\
  end

  def test_display_guns_options
    teoria = set_up
    assert teoria.varre_possibilidades('ARMAS') == 
      '0)Peixeira'\
      '1)DynaTAC 8000X (o primeiro aparelho celular do mundo)'\
      '2)Trezoitão'\
      '3)Trebuchet'\
      '4)Maça'\
      '5)Gládio'\
  end
end
