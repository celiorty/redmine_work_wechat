module Craftmine
  module Helper
    def self.author
      + "<br> redmineplugins.cn".html_safe
    end
    def self.name
      %Q( <span style='color: yellow; 
      background-color: green; 
      font-family: "Courier New",KaiTi,KaiTi_GB2312,STKaiTi,"\6977\4F53",Verdana, sans-serif !important;
      border-radius: 8px; padding: 0 8px;'> \
      修改版
      </span>).html_safe
    end
    def self.description
      %Q( <a style= "font-family: 'Courier New',KaiTi,KaiTi_GB2312,STKaiTi,'\6977\4F53',Verdana, sans-serif !important;" 
      href=https://www.redmineplugins.cn>(由 www.redmineplugins.cn 提供下载)</a>).html_safe
    end
    def self.version
      "_2".html_safe
    end 
  end

  module InstanceMethods
  end

end

Redmine::Plugin.find(:redmine_work_wechat).instance_eval do
  @name = @name.html_safe + Craftmine::Helper::name
  @description = @description.html_safe + Craftmine::Helper::description
  @version = @version.html_safe + Craftmine::Helper::version
  @author = @author.html_safe + Craftmine::Helper::author
end
