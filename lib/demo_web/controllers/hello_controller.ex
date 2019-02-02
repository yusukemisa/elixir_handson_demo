defmodule DemoWeb.HelloController do
  use DemoWeb, :controller # コントローラー関連の機能を使うための指定

  @doc """
  conn : コネクションの構造体、通信接続情報がここの中に含まれる
  params : 画面表示時のURLパラメータなどの情報が含まれる
  """
  def hello(conn, params) do
    # paramsはマップってなぜわかる？ルーターの定義で指定可能なアクション関数のインターフェースがそうなってる？
    name = params["name"]
    # ここでいきなりPhoenix.Controllerのrenderが使えるのはなぜ？→上位のDemoWebモジュールでuse宣言してる
    render(conn, "hello.html", %{who: name})
  end
end
"""
複数行コメントはダブルクオーテーション３つ。エディタ的に一つ作ると補完で２つできるので非常にうざい。

moduleはdefの定義内容を特定するためのパスとなり得る。
以下の二つの定義は等価。まあ上位モジュール内でなんでも定義するとごちゃつくのでドットで繋げて定義自体は分けたほうがよさそう。

defmodule DemoWeb do
  defmodule HelloController do
    def hello do
    end
  end
end

defmodule DemoWeb.HelloController do
  def hello do
  end
end

"""
