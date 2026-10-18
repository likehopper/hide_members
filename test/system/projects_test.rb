require File.expand_path('../../../../test/application_system_test_case', __dir__)

class HideMembersProjectsSystemTest < ApplicationSystemTestCase
  fixtures :projects, :versions, :users, :email_addresses, :roles, :members,
           :member_roles, :issues, :trackers, :projects_trackers,
           :issue_statuses, :enabled_modules, :enumerations, :custom_fields,
           :custom_values, :time_entries

  test 'members box is hidden without permission' do
    log_user('jsmith', 'jsmith')
    visit '/projects/ecookbook'

    assert_no_selector 'div.members.box'
  end

  test 'members box is visible with permission' do
    Role.find(1).add_permission! :view_members_box
    log_user('jsmith', 'jsmith')
    visit '/projects/ecookbook'

    assert_selector 'div.members.box'
    assert_selector 'div.members.box h3', text: 'Members'
  end
end
