##
# output for "error" 200
#
# called by 'error 200 "Foo"' in VCL
#
# icon from http://austintheheller.deviantart.com/art/August-Iconset-62107634
##

sub vcl_error {
	if (obj.status == 200) {
		set obj.http.Content-Type = "text/html; charset=utf-8";
		synthetic {"<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xml:lang="en" xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="robots" content="noindex, nofollow" />
	<title>"} + obj.status + " - " + obj.response + {"</title>
	<style type="text/css">
		body { background: none no-repeat scroll 0 0 white; color: #222; padding-left: 10%; padding-top: 2em; font: 14px sans-serif; }
		#errorpage { width: 80%; height: auto !important; }
		.error_200 h2:before { vertical-align: top; content: url(data:image/png;base64,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) " "; }
	</style>
</head><body>
	<div id="errorpage" class="error_200">
		<h2>This is not an error!</h2>
		<p>Varnish wants you to know this:<br />
		<em>"} + obj.status + " - " + obj.response + {"</em></p>
		<hr />
	</div>
</body></html>
"};
		return (deliver);
	}
}
