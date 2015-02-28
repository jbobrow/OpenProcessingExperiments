
///////////////////////////////////////////////////////////////
// Processingによる二分法の対話的プログラム開発用フレームワーク
//    Crowbar（クロウバー）         白井　達也（Tatsuya Shirai)
//                       shirai＠mech.suzuka-ct.ac.jp, @tatsuva
///////////////////////////////////////////////////////////////
// これがメインのスケッチです．
// これはフレームワークなので実行してもなにも行いません．

// 動作に関わるオプションを指定して下さい．
void Options() {
  crowbar.disableTextArea();
  crowbar.nonStop();
}

// パラメータ入力前に行っておきたい処理（setup()の最初に自動実行）
void initCrowbar() {
  crow = startCrowbar.generate(50, 30, 0);  // ※１
}
crowbarClass crow;                          // ※２

void Setup()
{
  crow.programComment("Crowbar + Tomahawk : ベンチマーク");
  crow.programComment("テキスト出力（半角英数字）");
  crow.programComment("userDraw()で画面更新");
}

// メインルーチン
// ユーザのメインのプログラム（１度しか実行されない）を以下に記述
void Main() {
}


