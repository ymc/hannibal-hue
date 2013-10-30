<%!from desktop.views import commonheader, commonfooter %>
<%namespace name="shared" file="shared_components.mako" />

${commonheader("Hannibal", "hannibal", user, "100px") | n,unicode}
${shared.menubar(section='hannibal')}

<div class="hannibal">
  <div class="container-fluid">
    <iframe class="hannibal" width="100%" name="hannibal" border="0" frameborder="0">Loading...</iframe>
  </div>
</div>

<script type="text/javascript">

var resizeHandler = function() {
  $('iframe.hannibal').height($(window).height() - $("iframe.hannibal").offset().top - 20);
};
$(document).ready(resizeHandler);
$(window).resize(resizeHandler);

var url = "${settings.host_url}";
$.ajax({
  url: url+'/api/heartbeat', 
  dataType: "script",
  success: function(data) { 
    console.log("Hannibal is available", url);
    $('iframe.hannibal').attr('src', url);
  },
  error: function() {
    console.log("Hannibal not available at", url);
    document.location.href = "/hannibal/hannibal_not_available";
  }
});
</script>

${commonfooter(messages) | n,unicode }
