
cc=cl
link=link

cflags=/nologo /W3 /EHsc /O2 /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "TELNET" /D "GAPING_SECURITY_HOLE" /D _CRT_SECURE_NO_WARNINGS /FD /c 
lflags=kernel32.lib user32.lib wsock32.lib winmm.lib /nologo /subsystem:console /machine:I386 /out:nc.exe

all: nc.exe

getopt.obj: getopt.c
    $(cc) $(cflags) getopt.c

doexec.obj: doexec.c
    $(cc) $(cflags) doexec.c

netcat.obj: netcat.c
    $(cc) $(cflags) netcat.c


nc.exe: getopt.obj doexec.obj netcat.obj
    $(link) getopt.obj doexec.obj netcat.obj $(lflags)

clean:
	del *.exe *.obj *.idb *.ilk