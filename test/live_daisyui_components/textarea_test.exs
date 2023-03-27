defmodule LiveDaisyuiComponents.TextareaTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import LiveDaisyuiComponents.Textarea

  alias LiveDaisyuiComponents.Utils

  test "textarea" do
    assigns = %{}

    textarea =
      rendered_to_string(~H"""
      <.textarea placeholder="textarea placeholder" />
      """)

    assert textarea =~
             ~s(<textarea class="textarea" placeholder="textarea placeholder">)

    textarea =
      rendered_to_string(~H"""
      <.textarea />
      """)

    assert textarea =~ ~s(<textarea class="textarea">)
    refute textarea =~ ~s(text input placeholder)
  end

  test "textarea colors" do
    for color <- Utils.colors() do
      assigns = %{color: color}

      assert rendered_to_string(~H"""
             <.textarea color={@color} />
             """) =~ ~s(<textarea class="textarea textarea-#{color}">)
    end
  end

  test "textarea sizes" do
    for size <- Utils.sizes() do
      assigns = %{size: size}

      assert rendered_to_string(~H"""
             <.textarea size={@size} />
             """) =~ ~s(<textarea class="textarea textarea-#{size}">)
    end
  end

  test "textarea boolean assigns" do
    for boolean_assign <- ~w(ghost bordered)a do
      assigns = %{boolean_assign => true}

      assert rendered_to_string(~H"""
             <.textarea {assigns} />
             """) =~ ~s(<textarea class="textarea textarea-#{to_string(boolean_assign)}">)
    end
  end
end