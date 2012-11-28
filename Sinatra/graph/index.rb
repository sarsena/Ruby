require 'rubygems'
require 'sinatra'

get '/' do
	'Hello World'
	erb :index
end

__END__
@@ layout
<html>
  <head>
    <title>Raphael Graph</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/css/graph/global.css" rel="stylesheet" media="screen">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="/js/raphael-min.js"></script>
    <script type="text/javascript" src="/js/g.raphael-min.js"></script>
    <script type="text/javascript" src="/js/g.bar-min.js"></script>
    <script type="text/javascript" src="js/jquery.qtip-1.0.0-rc3.min.js"></script>
    <script type="text/javascript" src="/js/graph/graph.js"></script>
  </head>
  <body>
   <%= yield %>
  </body>
</html>