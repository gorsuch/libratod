require 'libratod'
require 'minitest/autorun'

class ParserTest < MiniTest::Unit::TestCase
  def test_parses
    input = {
      'app'                => 'canary',
      'url'                => 'http://www.canary.io',
      'name'               => 'sites.canary',
      'source'             => 'heroku-us',
      't'                  => 1413410554,
      'curl_status'        => 0,
      'http_status'        => 200,
      'total_time'         => 0.023362,
      'namelookup_time'    => 0.001490,
      'connect_time'       => 0.008763,
      'starttransfer_time' => 0.016058,
      'ip'                 => '199.27.76.133'
    }

    expected = {
      'sites.canary.namelookup_time'    => 0.001490,
      'sites.canary.connect_time'       => 0.008763,
      'sites.canary.starttransfer_time' => 0.016058,
      'sites.canary.total_time'         => 0.023362,
      'sites.canary.http_status.200'    => 1,
      'sites.canary.curl_status.0'      => 1
    }


    parser = Libratod::Parser.new
    h = parser.parse(input)
    assert_equal expected, h
  end
end
