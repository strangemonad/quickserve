# QuickServe

 -- Too close for missiles, switching to guns

Sometimes what you really need is a way to serve static files.

You don't want to take the time to design routes - you have files in
folders for that. You don't even want to be bothered with something on the level
of Sinatra.

   cd /my/awesome/web-client
   quickserve

The above command will make public on port 8080 whatever is in $PWD. You can tweek this a
little:

   quickserve -p 3000 ./public


QuickServe should be fairly performant since it's written in haskell
and based on Warp.

In the spirit of Unix tools, QuickServe does 1 thing and does it well:

* It won't support caching beyond what your OS file system buffer gives
  you.
* It won't support configuration files.
* It won't support asset pipelines or compilation (e.g. coffeescript ->
  javascript, sass -> css)

# Philosophy

Why do you need QuickServe when you can `python -m SimpleHTTPServer 8080`?

Well why do you need `cat` and `grep` when you can `ruby -e
"File.open('README.md').each {|line| puts line if line.include?
'quick'}"`. It's also performant.

Why don't you support asset pipelines it would be trivial to allow
wrapping of request handlers? For exmample, if you run into request for "/scripts/app.cs"
request you transform it on the fly to "/scripts/app.js".

Sure, that part's pretty easy to reason about. Undoubtedly, someone
comes along and wants that to perform so you have to start worryng about
storing the compiled result somewhere. Storing it to disk is simple
enough but now you have to worry about the source file changing during
developemnt iterations or deploys. You've also given up determinism for the latency
of the first response byte.

## Complecting

The arguments against caching for incoming requests and watching for
changes to the served directory are similar - you can do a
better job with specialized tools for each of those things because you
can choose the tool that suites you current task without SquickServe
needing to know the details.

For example, if you're developing, you can run a tool that knows about
your source structure, watching for changes, recompiling and copying the
results into the folder being served.


TODO:
* actually serve something out
* specify a directory to serve rather than forcing PWD
* allow specifying a port
* becnhmarks
* access logging
