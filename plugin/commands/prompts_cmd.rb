module AresMUSH
  module Prompts
    class PromptsCmd
      include CommandHandler

      attr_accessor :num_prompts

      def parse_args
        # Default to 5 prompts if not specified
        self.num_prompts = (cmd.args ? cmd.args.to_i : 5)
      end

      def allow_without_login
        true
      end

      def handle
        prompts = load_prompts_from_config

        if prompts.empty?
          client.emit_failure("No prompts available in the configuration.")
          return
        end

        if self.num_prompts > prompts.size
          self.num_prompts = prompts.size
          client.emit_failure("Only #{self.num_prompts} prompts are available. Displaying all available prompts.")
        end

        selected_prompts = prompts.sample(self.num_prompts)

        prompts_template = PromptsTemplate.new(selected_prompts)

        client.emit prompts_template.render
      end

      def load_prompts_from_config
        config = Global.read_config("prompts")
        
        prompts = config['rp_prompts']

        prompts || []
      end
    end
  end
end
