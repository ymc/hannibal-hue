
<%!
def is_selected(section, matcher):
  if section == matcher:
    return "active"
  else:
    return ""
%>

<%def name="menubar(section='')">
  <div class="subnav subnav-fixed">
    <div class="container-fluid">
      <ul class="nav nav-pills">
        <li class="${is_selected(section, 'hannibal')}"><a href="/hannibal">Hannibal</a></li>
        <li class="${is_selected(section, 'settings')}"><a href="/hannibal/settings">Settings</a></li>
      </ul>
    </div>
  </div>
</%def>
