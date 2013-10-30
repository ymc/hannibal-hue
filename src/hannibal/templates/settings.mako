<%!from desktop.views import commonheader, commonfooter %>
<%namespace name="shared" file="shared_components.mako" />

${commonheader("Hannibal", "hannibal", user, "100px") | n,unicode}
${shared.menubar(section='settings')}

## Use double hashes for a mako template comment
## Main body

<div class="hannibal">
	<div class="container-fluid">
		<form action="/hannibal/settings" method="post"><% csrf_token %>

		% if cause == "not_available":
		  <ul class="errorlist">
		      <li>
		          Hannibal is not reachable at this location.
		      </li>
		  </ul>
		% endif

		${ form.as_p() | n,unicode}
		<p><label for="id_host_url">(e.g. http://localhost:9000)</p>
		## ${ form.host_url.errors }
		## <input id="id_subject" type="text" name="host_url" maxlength="100" />
		## ${ form.host_url() }

		  <input type="submit" value="Save" />
		</form>
	</div>
</div>

${commonfooter(messages) | n,unicode }
