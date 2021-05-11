  # patches
  require_dependency 'redmine_qy_wechat/patches/issues_controller_patch'
  require_dependency 'redmine_qy_wechat/patches/corp_wechats_journals_patch'
  #require_dependency 'redmine_qy_wechat/patches/users_controller_patch'
  require_dependency 'redmine_qy_wechat/patches/project_patch'
  require_dependency 'redmine_qy_wechat/patches/user_patch'
  require_dependency 'redmine_qy_wechat/patches/account_controller_patch'
  require_dependency 'redmine_qy_wechat/patches/issue_model_patch'
  # hooks
  require_dependency 'redmine_qy_wechat/hooks/views_users_hook'
  require_dependency 'redmine_qy_wechat/hooks/work_wechat_hook_listener'
  # helpers
  require_relative 'redmine_qy_wechat/helpers/craftmine_helper'

module QyWechat
  def self.settings() Setting[:plugin_redmine_qy_wechat].blank? ? {} : Setting[:plugin_redmine_qy_wechat]  end
end
