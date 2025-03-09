module AresMUSH
  module Prompts
    def self.plugin_dir
      File.dirname(__FILE__)
    end

    def self.shortcuts
      Global.read_config("prompts", "shortcuts")
    end

    def self.achievements
      Global.read_config('prompts', 'achievements')
    end


    def self.prompts
      config = Global.read_config("prompts")
      prompts = config['rp_prompts'] || []  # If rp_prompts is not found, return an empty array
      prompts
    end

    def self.get_cmd_handler(client, cmd, enactor)
      case cmd.root
      when "prompts"
        if cmd.switch == "bingo"
          return BingoCmd
        else
          return PromptsCmd
        end
      end
      nil
    end

    def self.get_event_handler(event_name)
      nil
    end

    def self.get_web_request_handler(request)
      case request.cmd
      when "prompts"
        return PromptsWebRequestHandler
      when "bingo"
        return BingoWebRequestHandler
      end
      nil
    end
  end
end
