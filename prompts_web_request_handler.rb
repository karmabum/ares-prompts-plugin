module AresMUSH
  module Prompts
    class PromptsWebRequestHandler
      def handle(request)
        prompts = Prompts.prompts  # or load_prompts_from_config

        if prompts.empty?
          return { error: "No prompts available in the configuration." }
        end

        selected_prompts = prompts.sample(5)

        { prompts: selected_prompts }
      end
    end
  end
end
