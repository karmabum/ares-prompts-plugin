module AresMUSH
  module Prompts
    class BingoTemplate < ErbTemplateRenderer
      attr_accessor :bingo_card

      def initialize(bingo_card)
        @bingo_card = bingo_card
        super File.dirname(__FILE__) + "/bingo.erb"
      end
    end
  end
end
