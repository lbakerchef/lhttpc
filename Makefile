.PHONY: all release compile test clean doc dialyzer

PROJECT = lhttpc

REBAR := ./rebar3

APPS = kernel stdlib sasl inets ssl public_key crypto compiler

all: compile doc

compile:
	$(REBAR) compile

doc:
	$(REBAR) edoc

test:	compile
	$(REBAR) eunit

release: all dialyze test
	$(REBAR) release

clean:
	$(REBAR) clean

dialyzer:
	@$(REBAR) dialyzer
