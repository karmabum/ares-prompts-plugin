module AresMUSH
  module Prompts
    class PromptsTemplate < ErbTemplateRenderer
      attr_accessor :prompts

      def initialize(prompts)
        self.prompts = prompts
        super File.dirname(__FILE__) + "/prompts.erb"  # path to your template file
      end

      def render
        super
      end
    end
  end
end
