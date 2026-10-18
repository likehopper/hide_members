require File.expand_path('../../test_helper', __FILE__)

class HideMembersProjectsIntegrationTest < Redmine::IntegrationTest
  fixtures :projects, :versions, :users, :email_addresses, :roles, :members,
           :member_roles, :issues, :trackers, :projects_trackers,
           :issue_statuses, :enabled_modules, :enumerations, :custom_fields,
           :custom_values, :time_entries

  def test_members_box_is_hidden_without_permission
    log_user('jsmith', 'jsmith')
    get '/projects/ecookbook'

    assert_response :success
    assert_select 'div.members.box', 0
  end

  def test_members_box_is_visible_with_permission
    Role.find(1).add_permission! :view_members_box
    log_user('jsmith', 'jsmith')
    get '/projects/ecookbook'

    assert_response :success
    assert_select 'div.members.box'
    assert_select 'div.members.box h3', :text => 'Members'
  end
end
