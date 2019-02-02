defmodule DemoWeb.ChatChannel do
  use DemoWeb, :channel # チャネル関連の機能を使うための宣言

  """
  チャネル接続時にjoin/3 が呼ばれる
  def join(<トピック名>, <チャネルが受け取るデータ>, <ソケット構造体>) do
    # チャネル接続時の処理
    {:ok, <ソケット構造体>}
  end
  """
  def join("chat:lobby", payload, socket) do
    Process.flag(:trap_exit, true) # 異常時にプロセスが死なない為の設定
    {:ok, load_messages(), socket}
  end

  """
  メッセージ受診時に呼ばれる
  def handle_in(<メッセージの種類>, <メッセージ内容>, <ソケット構造体>) do
    # メッセージ受信時の処理
    {:reply, <クライアントへの送信内容>, socket}
  end
  """
  def handle_in("new_msg", payload, socket) do
    save_message(payload)
    broadcast! socket, "new_msg", payload
    {:reply, {:ok, payload}, socket}
  end
  #異なる引数で同じアリティの関数を複数定義することができる
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  defp load_messages() do
    Agent.get(Demo.History, fn messages -> Enum.reverse(messages) end)
  end

  defp save_message(message) do
    Agent.update(Demo.History, fn messages -> [message | messages] end)
  end
end
