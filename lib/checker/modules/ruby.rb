module Checker
  module Modules
    class Ruby < Base
      extensions 'rb'
      private
      def check_one(file, opts = {})
        plain_command("ruby -c #{file}", :bundler => false)
      end
    end
  end
end
