# NMF_tutorial
NMFの実装演習

- NMF.m : 非負乱数行列を生成し，NMF結果を出力するプログラム
- calcNMF.m : 入力された非負行列Xを基底数Kに従ってNMFする関数

  [Input]
    X : 非負観測行列（IxJ）
    K : 基底数（スカラー，defalt=10）
    nIter : NMFの更新反復回数（スカラー，defalt=1000）
  [Output]
    W : NMFの基底行列（IxK）
    H : NMFの係数行列（KxJ）
    WH : NMFの推定行列（IxJ）
  
- main.m : calcNMFを実行するメインファイル
- DGTtool.m : 
- guitar.wav : 
