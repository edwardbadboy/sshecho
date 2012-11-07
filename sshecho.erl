-module(sshecho).
-export([start/0, welcome/0]).

% If you want to start:
% crypto:start().
% ssh:start().
% {ok, Pid} = ssh_cli:listen(fun sshecho:start/0, 8642)
% If you want to stop:
% ssh:stop_daemon(Pid).

start()->
	spawn(?MODULE, welcome, []).

welcome()->
	io:format("Hello~n"),
	mainLoop().

mainLoop()->
	Line = io:get_line("> "),
	case Line of
		"q\n" -> ok;
		_ -> io:format("You said ~s", [Line]),
			 mainLoop()
	end.
