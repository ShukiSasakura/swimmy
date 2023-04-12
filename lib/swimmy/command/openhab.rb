module Swimmy
  module Command
    class Openhab < Swimmy::Command::Base
      OPENHAB_URI = ENV["OPENHAB_API_KEY"]
      #OPENHAB_URI = "http://openhab.gc.cs.okayama-u.ac.jp/rest/items?metadata=swimmy"
      command "openhab" do |client, data, match|
        client.say(channel: data.channel, text: match[:expression])
        openhab_uri = ENV["OPENHAB_API_KEY"] 
        puts "start"
        puts "openhab_uri_a = '#{openhab_uri}'"
        puts "end"
        puts match[:expression]
        result_data_text = Swimmy::Service::Openhabinfo.new(openhab_uri).fetch_info(match[:expression])
        #client.say(channel: data.channel, text: "aa")
        client.say(channel: data.channel, text: result_data_text)
      end

      help do
        #openhab_uri = "http://openhab.gc.cs.okayama-u.ac.jp/rest/items?metadata=swimmy"
        openhab_uri = ENV["OPENHAB_API_KEY"]
        puts "start2"
        puts "openhab_uri_b = '#{openhab_uri}'"
        puts "end2"
        helpinfo = Swimmy::Service::Openhabinfo.new(openhab_uri).fetch_help
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
