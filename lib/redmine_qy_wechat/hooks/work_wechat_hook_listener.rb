class WorkWechatHookListener < Redmine::Hook::ViewListener
  render_on :view_account_login_bottom, :partial => "account/login_dingtalk"
  render_on :view_issues_show_details_bottom, :partial => "issues/dingtalk_flow"
  def view_layouts_base_html_head(context = { })
    stylesheet_link_tag('wechat-ding.css', :plugin => 'redmine_work_wechat')
  end
end
