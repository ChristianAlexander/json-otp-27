# JSON OTP 27 Demo

In OTP 27, Erlang received standard library support for JSON!

This repository demonstrates how to use this in Elixir.
For the first time, it's not necessary to install a JSON package like Poison or Jason.

Credit for this feature goes to https://github.com/michalmuskala, who built the Jason package and then worked through the Erlang Enhancement Process (EEP) to bring this support to all of us! ([EEP-0068](https://github.com/erlang/eep/blob/master/eeps/eep-0068.md))

## Installation

Ensure you're running an Erlang OTP version >= 27.0 and a compatible Elixir version.

If you use the [asdf software manager](https://asdf-vm.com/), you should be able to run `asdf install` (since it reads from [.tool-versions](./.tool-versions)).

## Running

This repo is made up of tests in [demo_test.exs](./test/demo_test.exs) to demonstrate the new OTP 27 JSON support.

To test it out, call `mix test`.
