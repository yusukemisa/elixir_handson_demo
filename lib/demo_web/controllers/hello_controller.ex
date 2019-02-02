defmodule DemoWeb.HelloController do
  use DemoWeb, :controller # コントローラー関連の機能を使うための指定

  def hello(conn, params) do
    # viewの表示の処理(後ほど実装)
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
