Redmine::Plugin.register :hide_members do
  name 'Hide Members Box'
  author 'Matthew Boynes'
  description 'Adds a "View members box" permission (which is off by default) to view or hide the members box on the project overview screen.'
  version '0.0.2'
  url 'https://github.com/likehopper/hide_members'
  author_url 'http://alleyinteractive.com/'

  permission :view_members_box, {}
end
