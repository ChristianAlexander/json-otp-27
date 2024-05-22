defmodule DemoTest do
  use ExUnit.Case

  describe ":json.encode" do
    test "encodes atom-keyed map as iodata" do
      encoded = :json.encode(%{hello: "world"})
      binary = IO.iodata_to_binary(encoded)

      assert binary == "{\"hello\":\"world\"}"
    end

    test "encodes string-keyed map as iodata" do
      encoded = :json.encode(%{"hello" => "world"})
      binary = IO.iodata_to_binary(encoded)

      assert binary == "{\"hello\":\"world\"}"
    end
  end

  describe ":json.decode" do
    test "decodes JSON string to string-keyed map" do
      decoded = :json.decode("{\"hello\":\"world\"}")
      expected = %{"hello" => "world"}

      assert decoded == expected
    end

    test "uses atom keys when a custom decoder is provided" do
      # This decoder converts keys into atoms, but beware!
      # Atoms are expensive in Erlang, so using `String.to_atom/1` on user input is a bad idea.
      # This is just a demo. In real code, either use string keys or `String.to_existing_atom/1`.
      object_push_decoder = fn key, value, acc -> [{String.to_atom(key), value} | acc] end

      # Notice that ther result of `:json.decode/3` is not just the object.
      # That's because this is a lower level API that exposes a fold.
      {decoded, _acc, _rest} =
        :json.decode("{\"hello\":\"world\",\"example\":123}", [], %{
          object_push: object_push_decoder
        })

      expected = %{hello: "world", example: 123}

      assert decoded == expected
    end
  end
end
