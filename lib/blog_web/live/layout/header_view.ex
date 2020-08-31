defmodule BlogWeb.Layout.HeaderView do
  use Phoenix.LiveView

  def render(assigns) do
    Phoenix.View.render(BlogWeb.LayoutView, "header.html", assigns)
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :display_mobile_menu, true)}
  end

  def handle_event("toggle_mobile_menu", _value, socket) do
    {:noreply, assign(socket, :display_mobile_menu, !socket.assigns.display_mobile_menu)}
  end
end
