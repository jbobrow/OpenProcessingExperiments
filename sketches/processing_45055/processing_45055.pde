
// 定数
static final int FLD_WIDTH = 8;   // フィールド縦サイズ
static final int FLD_HEIGHT = 8;  // フィールド横サイズ
static final int STONE_SIZE = 30; // 石サイズ
static final int BLANK = 0;       // 空き
static final int BLACK = 1;       // 黒石
static final int WHITE = 2;       // 白石
static final int AvailableB = 3; // 黒石の置ける場所
static final int AvailableW = 4; // 黒石の置ける場所
static final int Player1 = 0;     // Player1 (プレイヤー)
static final int Player2 = 1;     // Player2 (CPU)
static final int GAME_INIT = 0;   // ゲーム初期化
static final int GAME_PLAY = 1;   // ゲームPlaying
static final int GAME_PL1PASS = 2;// Player1パス
static final int GAME_PL2PASS = 3;// Player2パス
static final int GAME_WIN = 4;    // Player勝利
static final int GAME_LOSE = 5;   // CPU勝利
static final int GAME_DRAW = 6;   // 引き分け
 
// 変数
int [][] field = new int[FLD_WIDTH][FLD_HEIGHT];       // フィールド情報
//int [][] refMap = new int[FLD_WIDTH][FLD_HEIGHT];  // 参照用フィールド情報
int turn = 0;       // 順番
int state = 0;      // ゲーム状態
int blackCnt = 0;   // 黒石の数
int whiteCnt = 0;   // 白石の数
boolean isLeft = false;   // マウスの左ボタンが押されたかどうかのフラグ
boolean isTrig = false;   // マウスのボタンの押しっぱなし防止フラグ
boolean player1Pass = false;
boolean player2Pass = false;
int player1Cnt = 0;      // Player1の盤面に置ける石の候補数
int player2Cnt = 0;      // Player1の盤面に置ける石の候補数
int gameTimer = 0;
int aiteX = -100;
int aiteY = -100;
 
 
// 初期設定
void setup()
{
  size(240, 240);
  background(0, 128, 0);
 
  reset();
  state = GAME_PLAY;
}
 
void draw()
{
  // 画面情報クリア
  fill(0, 128, 0);
  rectMode(CORNER);
  rect(0, 0, width , height);
   
   
  update();
   
  // 描画処理
  int ii;
  // 縦線
    for(ii = 0; ii < 9; ++ii) {
      line(STONE_SIZE * ii, 0, STONE_SIZE * ii, height);
    }
    // 横線
    for(ii = 0; ii < 9; ++ii) {
      line(0, STONE_SIZE * ii, width, STONE_SIZE*ii);
    }
     
    // ゲーム状態毎に描画
  switch(state) {
  case GAME_INIT :
     break;
  case GAME_PLAY :
     for(ii = 0; ii < FLD_WIDTH; ++ii) {
        for(int jj = 0; jj < FLD_HEIGHT; ++jj) {
           int xx = (STONE_SIZE / 2) + ii * STONE_SIZE;
           int yy = (STONE_SIZE / 2) + jj * STONE_SIZE;
           // field変数の中身に応じて描画するものを変化
           switch(field[ii][jj]) {
           case BLANK :
              break;
           case BLACK :
              fill(0);
              ellipse(xx, yy, STONE_SIZE, STONE_SIZE);
              break;
           case WHITE :
              fill(255, 255, 255);
              ellipse(xx, yy, STONE_SIZE, STONE_SIZE);
              break;
           case AvailableB :
              fill(0, 0, 255, 128);
              ellipse(xx, yy, STONE_SIZE / 2, STONE_SIZE / 2);
              //rect(ii * STONE_SIZE, jj * STONE_SIZE, STONE_SIZE, STONE_SIZE);
              break;
           case AvailableW :
              fill(255, 0, 0, 128);
              ellipse(xx, yy, STONE_SIZE / 2, STONE_SIZE / 2);
              //rect(ii * STONE_SIZE, jj * STONE_SIZE, STONE_SIZE, STONE_SIZE);
              break;
           }
            
        }
     }
     fill(255, 0, 0, 128);
    rect(aiteX * STONE_SIZE, aiteY * STONE_SIZE, STONE_SIZE, STONE_SIZE);
      
     break;
  case GAME_PL1PASS :
     for(ii = 0; ii < FLD_WIDTH; ++ii) {
        for(int jj = 0; jj < FLD_HEIGHT; ++jj) {
           int xx = (STONE_SIZE / 2) + ii * STONE_SIZE;
           int yy = (STONE_SIZE / 2) + jj * STONE_SIZE;
           // field変数の中身に応じて描画するものを変化
           switch(field[ii][jj]) {
           case BLANK :
              break;
           case BLACK :
              fill(0);
              ellipse(xx, yy, STONE_SIZE, STONE_SIZE);
              break;
           case WHITE :
              fill(255, 255, 255);
              ellipse(xx, yy, STONE_SIZE, STONE_SIZE);
              break;
           }
        }
     }
     fill(255, 0, 0);
     text("Player1 Pass", 100, 100);
     break;
  case GAME_PL2PASS :
     for(ii = 0; ii < FLD_WIDTH; ++ii) {
        for(int jj = 0; jj < FLD_HEIGHT; ++jj) {
           int xx = (STONE_SIZE / 2) + ii * STONE_SIZE;
           int yy = (STONE_SIZE / 2) + jj * STONE_SIZE;
           // field変数の中身に応じて描画するものを変化
           switch(field[ii][jj]) {
           case BLANK :
              break;
           case BLACK :
              fill(0);
              ellipse(xx, yy, STONE_SIZE, STONE_SIZE);
              break;
           case WHITE :
              fill(255, 255, 255);
              ellipse(xx, yy, STONE_SIZE, STONE_SIZE);
              break;
           }
        }
     }
     fill(255, 0, 0);
     text("Player2 Pass", 100, 100);
     break;
  case GAME_WIN :
     for(ii = 0; ii < FLD_WIDTH; ++ii) {
        for(int jj = 0; jj < FLD_HEIGHT; ++jj) {
           int xx = (STONE_SIZE / 2) + ii * STONE_SIZE;
           int yy = (STONE_SIZE / 2) + jj * STONE_SIZE;
           // field変数の中身に応じて描画するものを変化
           switch(field[ii][jj]) {
           case BLANK :
              break;
           case BLACK :
              fill(0);
              ellipse(xx, yy, STONE_SIZE, STONE_SIZE);
              break;
           case WHITE :
              fill(255, 255, 255);
              ellipse(xx, yy, STONE_SIZE, STONE_SIZE);
              break;
           }
        }
     }
     fill(255, 0, 0);
     text("Win.", 100, 100);
     break;
  case GAME_LOSE :
     for(ii = 0; ii < FLD_WIDTH; ++ii) {
        for(int jj = 0; jj < FLD_HEIGHT; ++jj) {
           int xx = (STONE_SIZE / 2) + ii * STONE_SIZE;
           int yy = (STONE_SIZE / 2) + jj * STONE_SIZE;
           // field変数の中身に応じて描画するものを変化
           switch(field[ii][jj]) {
           case BLANK :
              break;
           case BLACK :
              fill(0);
              ellipse(xx, yy, STONE_SIZE, STONE_SIZE);
              break;
           case WHITE :
              fill(255, 255, 255);
              ellipse(xx, yy, STONE_SIZE, STONE_SIZE);
              break;
           }
        }
     }
     fill(255, 0, 0);
     text("Lose.", 100, 100);
     break;
  case GAME_DRAW :
     for(ii = 0; ii < FLD_WIDTH; ++ii) {
        for(int jj = 0; jj < FLD_HEIGHT; ++jj) {
           int xx = (STONE_SIZE / 2) + ii * STONE_SIZE;
           int yy = (STONE_SIZE / 2) + jj * STONE_SIZE;
           // field変数の中身に応じて描画するものを変化
           switch(field[ii][jj]) {
           case BLANK :
              break;
           case BLACK :
              fill(0);
              ellipse(xx, yy, STONE_SIZE, STONE_SIZE);
              break;
           case WHITE :
              fill(255, 255, 255);
              ellipse(xx, yy, STONE_SIZE, STONE_SIZE);
              break;
           }
        }
     }
     fill(255, 0, 0);
     text("Draw.", 100, 100);
     break;
  }
   
  // Debug text
  /*fill(255, 0, 0);
  String str;
  str = turn==Player1? "Player1" : "Player2";
  text("Black : " + count(BLACK), 10, 20);
  text("White : " + count(WHITE), 10, 40);
  text("Blank : " + count(BLANK), 10, 60);
  text("Turn : " + str, 10, 80);*/
}
 
void update()
{
   switch(state) {
   case GAME_PLAY :
      // 順番に応じて処理を分岐
      switch(turn) {
      case Player1 :    // プレイヤー操作
         player1Pass = false;
         // 石を置くことの出来る場所がなければパス.
         if(player1Cnt < 1) {
            player1Pass = true;
            turn = Player2;
            gameTimer = 30;
            state = GAME_PL1PASS;
         }
         if((isLeft) && (!isTrig)) {
            int[] pos = new int[2];
            // マウス座標を代入
            pos[0] = mouseX;
            pos[1] = mouseY;
            pos = convertToPixel(pos);     // マウス座標を配列の添字情報に変換
            //println("pos : [" + pos[0] + "][" + pos[1] + "]");
            // 既に何か置かれているか調べる
            if ((field[pos[0]][pos[1]] == BLANK)
               || (field[pos[0]][pos[1]] == AvailableB) || (field[pos[0]][pos[1]] == AvailableW)) {
               // 石を置けるマスが存在するかどうか
               //println("field[" + pos[0] + "][" + pos[1] + "]");
               if (check(pos[0], pos[1], BLACK)) {
                  field[pos[0]][pos[1]] = BLACK;
                  eval(pos[0], pos[1], BLACK);
                  turn = Player2;
               } /*else {
                 player1Pass = true;
                 turn = Player2;
                 gameTimer = 30;
                 state = GAME_PL1PASS;
               }*/
            }
            isTrig = true;
         } else if(!isLeft && isTrig)
            isTrig = false;
         break;
      case Player2 :    // AI操作
         player2Pass = false;
         int[] pos = new int[2];
         pos = ai2(WHITE);
         // 移動先に石を置けるか判定
         if (check(pos[0], pos[1], WHITE)) {
           // 石を置く位置には何も石を置いていないかどうか
           if ((field[pos[0]][pos[1]] != BLACK) && (field[pos[0]][pos[1]] != WHITE)) {
               field[pos[0]][pos[1]] = WHITE;
               // 置いた位置を記録
               aiteX = pos[0];
               aiteY = pos[1];
               eval(pos[0], pos[1], WHITE);             // 石を置いた位置について反転処理
               turn = Player1;                          // 順番をPlayer1に変更
               player1Cnt = availableCheck(BLACK);      // Player1の置ける場所を更新
           }
         } else {
           player2Pass = true;
           turn = Player1;
           player1Cnt = availableCheck(BLACK);
           gameTimer = 30;
           state = GAME_PL2PASS;
         }
          
         break;
      }
    
      /*
      // ゲーム進行チェック
      // 置ける石が無くなった場合
      if (count(BLANK) == 0) {
        if (count(BLACK) > count(WHITE)) {
            // 黒石が白石より多い
            state = GAME_WIN;
         } else if(count(BLACK) < count(WHITE)) {
            // 白石が黒石より多い
            state = GAME_LOSE;
         } else {
            // 引き分け
            state = GAME_DRAW;
         }
      } else {
        // 両者がパスかどうか
        if (player1Pass && player2Pass) {
          if (count(BLACK) > count(WHITE)) {
            // 黒石が白石より多い
            state = GAME_WIN;
         } else if(count(BLACK) < count(WHITE)) {
            // 白石が黒石より多い
            state = GAME_LOSE;
         } else {
            // 引き分け
            state = GAME_DRAW;
         }
        }
      }*/
      judge();
      break;
   case GAME_PL1PASS :
      gameTimer--;
      if (gameTimer < 0)
         state = GAME_PLAY;
      break;
   case GAME_PL2PASS :
      gameTimer--;
      if (gameTimer < 0)
         state = GAME_PLAY;
      break;
   case GAME_WIN :
      if((isLeft) && (!isTrig)) {
         reset();
         state = GAME_PLAY;
         isTrig = true;
      } else if(!isLeft && isTrig)
         isTrig = false;
      break;
   case GAME_LOSE :
      if((isLeft) && (!isTrig)) {
         reset();
         state = GAME_PLAY;
         isTrig = true;
      } else if(!isLeft && isTrig)
         isTrig = false;
      break;
   case GAME_DRAW :
     if((isLeft) && (!isTrig)) {
         reset();
         state = GAME_PLAY;
         isTrig = true;
      } else if(!isLeft && isTrig)
         isTrig = false;
      break;
   }
    
}
 
// ゲーム進行チェック
void judge()
{
    // 置ける石が無くなった場合
    if ((count(BLANK) == 0) && (count(AvailableB) == 0) && (count(AvailableB) == 0)) {
       if (count(BLACK) > count(WHITE)) {
          // 黒石が白石より多い
          state = GAME_WIN;
        } else if(count(BLACK) < count(WHITE)) {
            // 白石が黒石より多い
            state = GAME_LOSE;
        } else {
           // 引き分け
           state = GAME_DRAW;
        }
   } else {
      // 両者がパスかどうか
      if (player1Pass && player2Pass) {
         if (count(BLACK) > count(WHITE)) {
            // 黒石が白石より多い
            state = GAME_WIN;
         } else if(count(BLACK) < count(WHITE)) {
            // 白石が黒石より多い
            state = GAME_LOSE;
         } else {
            // 引き分け
            state = GAME_DRAW;
         }
      }
   }
}
 
int[] convertToPixel(int[] mouseXY)
{
  int xx, yy;
  int[] pos = new int[2];
  xx = int(mouseXY[0] / STONE_SIZE);
  yy = int(mouseXY[1] / STONE_SIZE);
   
  pos[0] = xx;
  pos[1] = yy;
   
  return pos;
}
 
// マウスが押された時の処理
void mousePressed()
{
   if(mouseButton == LEFT)
     isLeft = true; 
}
 
// マウスが離された時の処理
void mouseReleased()
{
  isLeft = false;
}
 
// 初期設定
void reset()
{
   int ii, jj;
   // フィールドの初期化
   for(ii = 0; ii < FLD_WIDTH; ++ii) {
      for(jj = 0; jj < FLD_HEIGHT; ++jj) {
         field[ii][jj] = BLANK;
         //refMap[ii][jj] = BLANK;
      }
   }
   // 初期状態の石を配置
   field[3][3] = BLACK;
   field[4][4] = BLACK;
   field[3][4] = WHITE;
   field[4][3] = WHITE;
    
   // 順番をPlayer1に設定
   turn = Player1;
   player1Cnt = availableCheck(BLACK);
   player1Pass = false;
   player2Pass = false;
   aiteX = -100;
   aiteY = -100;
}               
 
 
// 石を置ける位置があるかどうかの判定
boolean check(int sx, int sy, int fieldColor)
{
   int xx, yy, cnt;
   int tmpX, tmpY;
   boolean isChange = false;
   tmpX = tmpY = 0;
   xx = sx;
   yy = sy;
   cnt = 0;
   for(int ii = -1;  ii < 2; ++ii) {
      for(int jj = -1;  jj < 2; ++jj) {
        // 基準座標を設定
        xx = sx;
        yy = sy;
        // 相手の石の数を初期化
        cnt = 0;
        // 元の位置(基準位置)は探索しない
        if ((ii == 0) && (jj == 0)) {
           continue;
        }
 
        // ある方向(ii, jj)について一直線に探索していく.
        // 一直線は最大で7回の探索が行われる.
         for(int ix = 0; ix < 8; ++ix) {
            xx += ii;
            yy += jj;
            //println("dir pos(" + ii + ", " + jj + ")");
            //println("ix:" + ix);
            //println("pos(" + xx + ", " + yy + ")");
            //println(fieldColor + ": [" + xx + "][" + yy + "]");
            // 対象が範囲内かどうかをチェック
            if ((xx < 0) || (xx >= FLD_WIDTH) || (yy < 0) || (yy >= FLD_HEIGHT)) {
              //println("Out of Range");
               break;
               }
            // 対象が空きマスかチェック。
            // 空きマスなら探索終了
            if ((field[xx][yy] == BLANK) || (field[xx][yy] == AvailableB) || (field[xx][yy] == AvailableW)){
               //println("Blank.");
               break;
            }
            // 対象が相手の石かどうかをチェック。
            // 相手の石ならカウントアップ
            if ((field[xx][yy] != fieldColor)) {
               cnt++;
               //println("cnt add(" + xx + ", " + yy + ")");
               continue;
            }
            // 対象が自分の石かチェック。
            // 間に相手の石が入っている(cntが1以上)ならtrueを返す
            if (field[xx][yy] == fieldColor) {
               if (cnt > 0) {
                 //String str = fieldColor==WHITE? "White" : "Black";
                 //println("origin(" + sx + ", " + sy + ") :" + str);
                 //println("cnt:" + cnt);
                  //if (isCheck) {
                     //println("isCheck True");
                     return true;
                  //}
 
               } else {
                  break;
               }
            }
         }  // ~
      }
   }
    
   //println("isCheck False");
   return isChange;
}
 
 // 石を置ける位置があるかどうかの判定し、位置と反転数を記録する。
 int reverseCnt = 0;                // 反転最大数
 int[] reversePos = new int[2];     // 反転場所
 boolean check2(int sx, int sy, int fieldColor)
{
   int xx, yy, cnt;
   int tmpX, tmpY;
   boolean isChange = false;
   tmpX = tmpY = 0;
   xx = sx;
   yy = sy;
   cnt = 0;
   
   for(int ii = -1;  ii < 2; ++ii) {
      for(int jj = -1;  jj < 2; ++jj) {
        // 基準座標を設定
        xx = sx;
        yy = sy;
        // 相手の石の数を初期化
        cnt = 0;
        // 元の位置(基準位置)は探索しない
        if ((ii == 0) && (jj == 0)) {
           continue;
        }
 
        // ある方向(ii, jj)について一直線に探索していく.
        // 一直線は最大で7回の探索が行われる.
         for(int ix = 0; ix < 8; ++ix) {
            xx += ii;
            yy += jj;
            //println("dir pos(" + ii + ", " + jj + ")");
            //println("ix:" + ix);
            //println("pos(" + xx + ", " + yy + ")");
            //println(fieldColor + ": [" + xx + "][" + yy + "]");
            // 対象が範囲内かどうかをチェック
            if ((xx < 0) || (xx >= FLD_WIDTH) || (yy < 0) || (yy >= FLD_HEIGHT)) {
              //println("Out of Range");
               break;
               }
            // 対象が空きマスかチェック。
            // 空きマスなら探索終了
            if ((field[xx][yy] == BLANK) || (field[xx][yy] == AvailableB) || (field[xx][yy] == AvailableW)){
               //println("Blank.");
               break;
            }
            // 対象が相手の石かどうかをチェック。
            // 相手の石ならカウントアップ
            if ((field[xx][yy] != fieldColor)) {
               cnt++;
               //println("cnt add(" + xx + ", " + yy + ")");
               continue;
            }
            // 対象が自分の石かチェック。
            // 間に相手の石が入っている(cntが1以上)ならtrueを返す
            if (field[xx][yy] == fieldColor) {
               if (cnt > 0) {
                 //String str = fieldColor==WHITE? "White" : "Black";
                 //println("origin(" + sx + ", " + sy + ") :" + str);
                 //println("cnt:" + cnt);
                  //if (isCheck) {
                     //println("isCheck True");
                     //return true;
                     // 前回のcntより今回のカウントが多ければ、
                     // フラグを立てて、位置を記録する。
                     if (cnt > reverseCnt) {
                        reverseCnt = cnt;
                        reversePos[0] = sx;
                        reversePos[1] = sy;
                        // 反転判定フラグをONに。
                        isChange = true;
                     }
                  //}
 
               } else {
                  break;
               }
            }
         }  // ~
      }
   }
    
   //println("isCheck False");
   return isChange;
}
 
// 引数で指定された石の置ける位置候補をカウントし、返す
int availableCheck(int fieldColor)
{
  int availableCnt = 0;
  for (int ii = 0; ii < FLD_WIDTH; ++ii) {
    for (int jj = 0; jj < FLD_HEIGHT; ++jj) {
      // 既に石が置かれていたら探索しない
      if ((field[ii][jj] == BLACK) || (field[ii][jj] == WHITE))
         continue;
      // 引数の石の色に基づき、反転できる石がある場所を探索する.
      if (check(ii, jj, fieldColor)) {
         field[ii][jj] = fieldColor + 2;
         availableCnt++;
      } else {
         field[ii][jj] = 0;
      }
     }
  }
   
  return availableCnt;
}
 
// 反転処理
// sx,sy   : 開始点
// dx, dy : 方向
// gx, gy : ゴール
// currentColor : 現在の色
void reverse(int sx, int sy, int dx, int dy, int gx, int gy, int currentColor, int count)
{
   int xx, yy;
   // 開始点を現在座標に設定
   xx = sx;
   yy = sy;
   for (int ix = 0; ix < count; ++ix) {
      xx += dx;
      yy += dy;
      if ((xx < 0) || (xx >= FLD_WIDTH) || (yy < 0) || (yy >= FLD_HEIGHT)) {
         //println("Error:Out of range");
      }
      field[xx][yy] = currentColor;
                      
      // 開始点から現在の座標まで反転が終わったかチェック
      if ((xx == gx) && (yy == gy)) {
         break;
      }
   }
}
 
void eval(int sx, int sy, int fieldColor)
{
   int xx, yy, cnt;
   int tmpX, tmpY;
   boolean isChange = false;
   tmpX = tmpY = 0;
   xx = sx;
   yy = sy;
   cnt = 0;
   for(int ii = -1;  ii < 2; ++ii) {
      for(int jj = -1;  jj < 2; ++jj) {
        xx = sx;
        yy = sy;
        cnt = 0;
        // 開始点と同じ位置だったらスキップ
        if ((ii == 0) && (jj == 0)) {
           continue;
        }
         
        // ある方向(ii, jj)について一直線に探索していく.
        // 一直線は最大で7回の探索が行われる.
         for(int ix = 0; ix < 8; ++ix) {
            xx += ii;
            yy += jj;
            // 対象が範囲内かどうかをチェック
            if ((xx < 0) || (xx >= FLD_WIDTH) || (yy < 0) || (yy >= FLD_HEIGHT)) {
               break;
            }
            // 対象が空きマスかチェック。
            // 空きマスなら探索終了
            if ((field[xx][yy] == BLANK) || (field[xx][yy] == AvailableB) || (field[xx][yy] == AvailableW)) {
               break;
            }
            // 対象が相手の石かどうかをチェック。
            // 相手の石ならカウントアップ
            if ((field[xx][yy] != fieldColor)) {
               cnt++;
               continue;
            }
            // 対象が自分の石かチェック。
            // 間に相手の石が入っている(cntが1以上)なら反転する
            if (field[xx][yy] == fieldColor) {
               if (cnt > 0) {
                 //String str = fieldColor==WHITE? "White" : "Black";
                 //println("pos(" + sx + ", " + sy + ") :" + str);
                  
                  //refMap[sx][sy] = fieldColor + 2;
 
                  // 反転処理のために基準位置を設定
                  tmpX = sx;
                  tmpY = sy;
                   
                  reverse(sx, sy, ii, jj, xx, yy, fieldColor, cnt);
 
               } else {
                  break;
               }
            }
         }
      }
   }
    
}
 
// 石の数をカウント
// 引数で渡された種類の石がフィールドにいくつ存在するかを返す
int count(final int fieldColor) {
   int cnt = 0;
   for(int ii = 0; ii < FLD_WIDTH; ++ii) {
      for(int jj = 0; jj < FLD_HEIGHT; ++jj) {
         // 引数の石の色とフィールドの石の色が一致したらカウントアップ
         if (field[ii][jj] == fieldColor)
            cnt++;
      }
   }
    
   return cnt;
}
 
// CPUの次回位置を返す
int[] ai(int playerColor)
{
   int[] pos = new int[2];
   boolean isCheck = false;
   // 左上から線形探索を行い、石が置かれておらず、
   // 相手の石を裏返すことの出来る位置を返す
   for (int ii = 0; ii < FLD_WIDTH; ++ii) {
     for (int jj = 0; jj < FLD_HEIGHT; ++jj) {
       // 既に石が置かれていたら探索しない
       if ((field[ii][jj] != BLANK) && (field[ii][jj] != AvailableB) && (field[ii][jj] != AvailableW))
          continue;
       isCheck = check(ii, jj, playerColor);
       if (isCheck) {
         pos[0] = ii;
         pos[1] = jj;
         return pos;
       }
     }
   }
   // 石の置かれていない位置をランダムに返す
   int xx, yy;
   xx = yy = 0;
   /*do {
      xx = int(random(FLD_WIDTH));
      yy = int(random(FLD_HEIGHT));
   } while(field[xx][yy] != BLANK);
     
    pos[0] = xx;
    pos[1] = yy;*/
    // 石を置ける場所が無いので適当な場所を返す
    pos[0] = int(random(FLD_WIDTH));
    pos[1] = int(random(FLD_HEIGHT));
     
   return pos;
}

int[] ai2(int playerColor)
{
   int[] pos = new int[2];
   reverseCnt = 0;
   boolean isCheck = false;
   // 左上から線形探索を行い、石が置かれておらず、
   // 相手の石を裏返すことの出来る位置を返す
   for (int ii = 0; ii < FLD_WIDTH; ++ii) {
     for (int jj = 0; jj < FLD_HEIGHT; ++jj) {
       // 既に石が置かれていたら探索しない
       if ((field[ii][jj] != BLANK) && (field[ii][jj] != AvailableB) && (field[ii][jj] != AvailableW))
          continue;
       isCheck = check2(ii, jj, playerColor);
       // 候補が存在
       if (isCheck) {
         pos[0] = ii;
         pos[1] = jj;
         return pos;
       }
     }
   }
   // 石の置かれていない位置をランダムに返す
   int xx, yy;
   xx = yy = 0;
   /*do {
      xx = int(random(FLD_WIDTH));
      yy = int(random(FLD_HEIGHT));
   } while(field[xx][yy] != BLANK);
     
    pos[0] = xx;
    pos[1] = yy;*/
    // 石を置ける場所が無いので適当な場所を返す
    pos[0] = int(random(FLD_WIDTH));
    pos[1] = int(random(FLD_HEIGHT));
     
   return pos;
}                       
