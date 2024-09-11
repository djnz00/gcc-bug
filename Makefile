all: gcc-bug.o

gcc-bug.o: gcc-bug.cc
	g++ -D_REENTRANT -D_GNU_SOURCE -D__x86_64__ -Wall -Wno-parentheses -Wno-invalid-offsetof -Wno-misleading-indentation -fstrict-aliasing -std=gnu++2b -ftemplate-backtrace-limit=0 -g -march=x86-64-v2 -fno-math-errno -fno-trapping-math -fno-rounding-math -fno-signaling-nans -DZDEBUG -Wno-non-template-friend -Wno-enum-compare -Wno-deprecated-enum-enum-conversion -Wno-int-in-bool-context -Wno-unused-value -Wno-sign-compare -c gcc-bug.cc -o gcc-bug.o
