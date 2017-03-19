require_relative '../teoria'
require 'test/unit'

class TeoriaTest < Test::Unit::TestCase
  def set_up(suspeito, local, armas)
    teoria = Teoria.new(suspeito,
                        local,
                        armas)
    return teoria.pergunta_testemunha
  end

  def test_all_wrong_return
    assert set_up(1,1,1).include? (1 or 2 or 3)
  end

  def test_all_correct_return
    assert set_up(4,5,7) == [0]
  end
end