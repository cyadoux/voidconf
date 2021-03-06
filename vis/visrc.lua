require('vis')

local set_filetype = function(win)
	local files = {
		[".1|.2|.3|.4|.5|.6|.7|.8|.9|.1x|.2x|.3x|.4x|.5x|.6x|.7x|.8x|.9x"] = "man",
		[".au3|.a3x"] = "autoit",
		[".as|.asc"] = "actionscript",
		[".adb|.ads"] = "ada",
		[".g|.g4"] = "antlr",
		[".ans|.inp|.mac"] = "apdl",
		[".apl"] = "apl",
		[".applescript"] = "applescript",
		[".asm|.ASM|.s|.S"] = "asm",
		[".asa|.asp|.hta"] = "asp",
		[".awk"] = "awk",
		[".bat|.cmd"] = "batch",
		[".bib"] = "bibtex",
		[".boo"] = "boo",
		[".cs"] = "csharp",
		[".c|.cc|.C"] = "ansi_c",
		[".cpp|.cxx|.c++|.h|.hh|.hpp|.hxx|.h++"] = "cpp",
		[".ck"] = "chuck",
		[".cmake|.cmake.in|.ctest|.ctest.in"] = "cmake",
		[".coffee"] = "coffeescript",
		[".css|.cassius|.lucius"] = "css",
		[".cu|.cuh"] = "cuda",
		[".d|.di"] = "dmd",
		[".dart"] = "dart",
		[".desktop"] = "desktop",
		[".diff|.patch"] = "diff",
		["Dockerfile"] = "dockerfile",
		[".dot"] = "dot",
		[".e|.eif"] = "eiffel",
		[".ex|.exs"] = "elixir",
		[".erl|.hrl"] = "erlang",
		[".dsp"] = "faust",
		[".feature"] = "gherkin",
		[".fs"] = "fsharp",
		[".fish"] = "fish",
		[".forth|.frt|.fs"] = "forth",
		[".f|.for|.ftn|.fpp|.f77|.f90|.f95|.f03|.f08"] = "fortran",
		[".g|.gd|.gi|.gap"] = "gap",
		[".po|.pot"] = "gettext",
		[".glslf|.glslv"] = "glsl",
		[".dem|.plt"] = "gnuplot",
		[".go"] = "go",
		[".groovy|.gvy"] = "groovy",
		[".gtkrc"] = "gtkrc",
		[".hs|.lhs"] = "haskell",
		[".htm|.html|.shtm|.shtml|.xhtml|.hamlet|.tpl"] = "html",
		[".icn"] = "icon",
		[".idl|.odl"] = "idl",
		[".inf|.ni"] = "inform",
		[".cfg|.cnf|.inf|.ini|.reg"] = "ini",
		[".io"] = "io_lang",
		[".bsh|.java"] = "java",
		[".js|.jsfl|.julius"] = "javascript",
		[".json"] = "json",
		[".jsp"] = "jsp",
		[".bbl|.dtx|.ins|.ltx|.tex|.sty"] = "latex",
		[".less"] = "less",
		[".lily|.ly"] = "lilypond",
		[".ledger|.journal"] = "ledger",
		[".cl|.el|.lisp|.lsp"] = "lisp",
		[".litcoffee"] = "litcoffee",
		[".lua"] = "lua",
		["GNUmakefile|.iface|.mak|.mk|makefile|Makefile"] = "makefile",
		[".md|.markdown"] = "markdown",
		[".moon"] = "moonscript",
		[".n"] = "nemerle",
		[".nim"] = "nim",
		[".nsh|.nsi|.nsis"] = "nsis",
		[".m|.mm|.objc"] = "objective_c",
		[".caml|.ml|.mli|.mll|.mly"] = "caml",
		[".dpk|.dpr|.p|.pas"] = "pascal",
		[".al|.perl|.pl|.pm|.pod"] = "perl",
		[".inc|.php|.php3|.php4|.phtml"] = "php",
		[".p8"] = "pico8",
		[".pike|.pmod"] = "pike",
		["PKGBUILD"] = "pkgbuild",
		[".ps1"] = "powershell",
		[".eps|.ps"] = "ps",
		[".prolog"] = "prolog",
		[".props|.properties"] = "props",
		[".pure"] = "pure",
		[".sc|.py|.pyw"] = "python",
		[".R|.Rout|.Rhistory|.Rt|Rout.save|Rout.fail"] = "rstats",
		[".r|.reb"] = "rebol",
		[".rst"] = "rest",
		[".orx|.rex"] = "rexx",
		[".erb|.rhtml"] = "rhtml",
		[".Rakefile|.rake|.rb|.rbw"] = "ruby",
		[".rs"] = "rust",
		[".sass|.scss"] = "sass",
		[".scala"] = "scala",
		[".sch|.scm"] = "scheme",
		[".sno|.SNO"] = "snobol4",
		[".bash|.bashrc|.bash_profile|.configure|.csh|.sh|.zsh"] = "bash",
		[".changes|.st|.sources"] = "smalltalk",
		[".ddl|.sql"] = "sql",
		[".tcl|.tk"] = "tcl",
		[".texi"] = "texinfo",
		[".toml"] = "toml",
		[".vala"] = "vala",
		[".vcf|.vcard"] = "vcard",
		[".v|.ver"] = "verilog",
		[".vh|.vhd|.vhdl"] = "vhdl",
		[".asa|.bas|.cls|.ctl|.dob|.dsm|.dsr|.frm|.pag|.vb|.vba|.vbs"] = "vb",
		[".wsf"] = "wsf",
		[".dtd|.svg|.xml|.xsd|.xsl|.xslt|.xul"] = "xml",
		[".xtend"] = "xtend",
		[".yaml|.yml|.cabal|.stack"] = "yaml",
	}

	local filename = win.file.name

	if filename ~= nil then
		filename = string.lower(filename)
		for patterns, lang in pairs(files) do
			for pattern in string.gmatch(patterns, '[^|]+') do
				if #filename >= #pattern then
					local s, e = string.find(filename, pattern, -#pattern, true)
					if s ~= e and e == #filename then
						win.syntax = lang
						return;
					end
				end
			end
		end
	end
end

vis.events.win_open = function(win)
	set_filetype(win)
	vis:command('set tabwidth 4')
	vis:command('set number')
	vis:command('set autoindent')
	vis:command('set show-tabs')
	vis:command('set cursorline')
	vis:command('set theme tomorrow-night')
end