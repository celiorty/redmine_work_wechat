module RedmineQyWechat
  module Patches
    module IssueModelPatch
      def self.included(base) # :nodoc: 
        base.class_eval do    
          unloadable # Send unloadable so it will not be unloaded in development
          include ERB::Util

          if Redmine::VERSION.to_s < '4.1'
            include GravatarHelper::PublicMethods 
          elsif Redmine::VERSION.to_s >= '4.1'
            include AvatarsHelper
          end

          def msg_author
            return author if last_updated_by.nil?
            return last_updated_by if last_updated_by.present?
          end

          def gravatar_api_url(hash)
            #强制使用libravatar
            +"seccdn.libravatar.org/avatar/#{hash}"
          end

          def msg_avatar_url(httpx)
            default_url = 'https://seccdn.libravatar.org/avatar/03d16eb99f6749e3eeb11707270f8a10?s=128&forcedefault=y&default=identicon'

            url = gravatar_url(msg_author.mail)
            return default_url if url.blank?

            case httpx
            when nil
              Setting.protocol + ':' + url
            when 'http'
              'http://' + url
            when 'https'
              'https://' + url
            else
              url
            end
          end

        end  
      end  
    end
  end
end
unless Issue.included_modules.include?(RedmineQyWechat::Patches::IssueModelPatch)
  Issue.send(:include, RedmineQyWechat::Patches::IssueModelPatch)
end
