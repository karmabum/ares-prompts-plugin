module AresMUSH
  module Prompts
    class BingoWebRequestHandler
      def handle(request)
        prompts = Prompts.prompts

        if prompts.size < 24
          return { error: "Not enough prompts available to generate a bingo card. At least 24 are required." }
        end

        bingo_card = generate_bingo_card(prompts)

        formatted_card = format_bingo_card(bingo_card)

        {
          bingo_card: bingo_card, 
          formatted_card: formatted_card # Copy-paste version
        }
      end

      private

      def generate_bingo_card(prompts)
        randomized_prompts = prompts.shuffle.take(24)
        randomized_prompts.insert(12, "FREE SPACE") # Add Free Space in the center
        randomized_prompts.each_slice(5).to_a # Convert to 2D array
      end

      def format_bingo_card(bingo_card)
        lines = ["## Roleplay Bingo", "", "[[div class=\"rp-bingo\"]]", "", "| B | I | N | G | O |", "| ----- | ----- | ----- | ----- | ----- |"]

        bingo_card.each do |row|
          line = "| " + row.map { |prompt| "#{prompt}" }.join(" | ") + " |"
          lines << line
        end

        lines << "\n"
        lines << "[[/div]]"

        lines.join("\n")
      end
    end
  end
end
