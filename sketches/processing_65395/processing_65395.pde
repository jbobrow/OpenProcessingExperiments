
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
//  crowbar.nonStop();
}

// パラメータ入力前に行っておきたい処理（setup()の最初に自動実行）
void initCrowbar() {
  crow = startCrowbar.generate(50, 30, 0);  // ※１
}
crowbarClass crow;                          // ※２

void Setup()
{
  crow.programComment("Crowbar + Tomahawk : ベンチマーク");
  crow.programComment("テキストスクロール（半角英数字）");
}

// メインルーチン
// ユーザのメインのプログラム（１度しか実行されない）を以下に記述
void Main() {
  int i, j;
  int imax, jmax;
  String startTime, endTime;
  int    startMillis, endMillis;
  startTime = nowDateTime();
  startMillis = millis();
  imax = 10;
  jmax = 10000;
  for (i = 0; i < imax; i++) {
    for (j = 0; j < jmax; j++) {
      crow.write(nf(j, 4, 0));
    }
    crow.newline();
  } 
  endTime = nowDateTime();
  endMillis = millis();
  int   moji;
  float duration;
  moji = jmax * 4 * imax;
  duration = (endMillis - startMillis) / 1000.0;
  crow.writeln("開始：" + startTime);
  crow.writeln("終了：" + endTime);
  crow.writeln("時間：" + str(duration));
  crow.writeln("文字数:" + str(moji));
  crow.writeln("一秒あたり:" + str(moji / duration) + " 文字");
}


