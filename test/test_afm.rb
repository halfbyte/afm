require 'helper'

class TestAfm < Test::Unit::TestCase
  
  def setup
    @font = AFM::Font.new(File.join(File.dirname(__FILE__), 'fixtures', 'Vera.afm'))
  end
  
  should "set metadata" do
    assert_equal "BitstreamVeraSans-Roman", @font.metadata['FontName']
  end
  should "set char_metrics" do
    assert_equal 400, @font.char_metrics['exclam'][:wx]
    assert_equal [85, -131, 310, 758], @font.char_metrics['parenleft'][:boundingbox]
  end
  
  should "get char metrics by char" do
    assert_equal 400, @font.metrics_for("!")[:wx]
  end
  
  should "open font with alternative method" do
    assert_not_nil AFM::Font.from_file(File.join(File.dirname(__FILE__), 'fixtures', 'Vera.afm'))
  end
  
end
