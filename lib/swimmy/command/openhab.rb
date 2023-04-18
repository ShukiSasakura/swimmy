module Swimmy
  module Command
    class Openhab < Swimmy::Command::Base
      command "openhab" do |client, data, match|
        keyword = match[:expression]
        result_text = ""
        error_text = "データが存在しません．入力が間違っている可能性があります．\n" +
                     "\"swimmy help openhab\" と入力して使用可能なキーワードを確認してください．"
        result_data = Swimmy::Service::Openhabinfo.new.fetch_info
        result_data.each do |data|
          if data.get_value == keyword
            puts data.get_value
            result_text += data.get_state
            result_text += "\n"
          end
        end
        if result_text == ""
          client.say(channel: data.channel, text: error_text)
        else 
          client.say(channel: data.channel, text: result_text)
        end
      end

      help do
        openhab_uri = ENV["OPENHAB_API_KEY"]
        helpinfo = Swimmy::Service::Openhabinfo.new.fetch_help
        title "openhab"
        desc "キーワードに対応したOpenHAB上の情報を表示します"
        long_desc "表示したい情報を<keyword>として以下のように入力することで，対応した情報を表示します．\n" +
                  "openhab <keyword>\n" +
                  "使用可能なキーワードは以下のものです．\n" +
                  "<keyword> : <description> \n" +
                  helpinfo 
      end

    end
  end
end
