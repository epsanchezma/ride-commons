defmodule RideCommons.NamingTest do
  alias RideCommons.Naming
  use ExUnit.Case

  test "dasherize" do
    assert Naming.dasherize("") == ""
    assert Naming.dasherize("FooBar") == "foo-bar"
    assert Naming.dasherize("FOOBar") == "foo-bar"
  end

  test "underscore" do
    assert Naming.underscore("") == ""
    assert Naming.underscore("FooBar") == "foo_bar"
    assert Naming.underscore("FOOBar") == "foo_bar"
  end

  test "camelize" do
    assert Naming.camelize("") == ""
    assert Naming.camelize("FooBar") == "FooBar"
    assert Naming.camelize("foo_bar") == "FooBar"
  end
end
