module AresMUSH
  module Prompts
    class BingoCmd
      include CommandHandler

      def handle
        prompts = load_prompts_from_config

        if prompts.size < 24
          client.emit_failure("Not enough prompts available to generate a bingo card. At least 24 are required.")
          return
        end

        bingo_card = generate_bingo_card(prompts)

        template = BingoTemplate.new(bingo_card)
        client.emit template.render
      end

      private

      def load_prompts_from_config
        config = Global.read_config("prompts")
        config['rp_prompts'] || []
      end

      def generate_bingo_card(prompts)
        randomized_prompts = prompts.shuffle.take(24)

        randomized_prompts.insert(12, "FREE SPACE")

        randomized_prompts.each_slice(5).to_a
      end
    end
  end
end
