require File.expand_path('../../test_helper', __FILE__)

class HideMembersPermissionTest < ActiveSupport::TestCase
  fixtures :roles

  def test_permission_is_registered_and_can_be_granted_to_roles
    permission = Redmine::AccessControl.permission(:view_members_box)

    assert_not_nil permission
    assert_empty permission.actions
    assert_includes Role.find(2).setable_permissions, permission
    assert_equal 'View members box', I18n.t(:permission_view_members_box, :locale => 'en')
  end

  def test_permission_is_not_granted_by_default
    refute Role.find(2).has_permission?(:view_members_box)
  end
end
