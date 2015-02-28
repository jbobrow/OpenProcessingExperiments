
int FLD_WIDTH = 3;
int FLD_HEIGHT = 3;
int [][] field = new int[FLD_WIDTH][FLD_HEIGHT];

int Player1 = 0;   // プレイヤー1
int Player2 = 1;   // プレイヤー2
int turn = 0;      // 順番
boolean winFlag;

void setup()
{
  size(320,320);
  background(255, 255, 255);
  line(0, 0, 0, 320);
  line(319, 0, 319, 319);

  int ii;

  // tate
  for(ii = 0; ii < 2; ++ii) {
    line(107 + 106*ii, 0, 107 + 106*ii, 320);
  }

  // yoko
  for(ii = 0; ii < 2; ++ii) {
    line(0, 107 + 106*ii, 320, 107 + 106*ii);
  }
  
  clear();

}

void draw()
{
  int tmp = isClear();
  if (tmp != 0) {
    if (tmp == 1) println("\nPlayer 1 Win.");
    if (tmp == 2) println("\nPlayer 2 Win.");
    for(int ii = 0; ii < 3; ++ii) {
      println(field[0][ii] + " " + field[1][ii] + " " + field[2][ii]);
    }
    clear();
  }
  
  // 思考ルーチン
  if (turn == Player2) {
    winFlag = ai();
  }
  // 描画ルーチン
  fill(255, 255, 255);
  rectMode(CORNER);
  rect(0, 0, width , height);
 
  if (winFlag == false) {
    line(0, 0, 0, 320);
    line(width, 0, width, height);

    int ii, jj;

    // tate
    for(ii = 0; ii < 2; ++ii) {
      line(107 + 106*ii, 0, 107 + 106*ii, height);
    }
    // yoko
    for(ii = 0; ii < 2; ++ii) {
      line(0, 107 + 106*ii, width, 107 + 106*ii);
    }
  
    for(ii = 0; ii < FLD_WIDTH; ++ii) {
      for(jj = 0; jj < FLD_HEIGHT; ++jj) {
        switch (field[ii][jj]) {
          case 1 :
            noFill();
            ellipse(53 +  ii * 106, 53 + jj * 106, 106, 106);
            break;
          case 2 :
            //fill(0);
            //ellipse(53 +  ii * 106, 53 + jj * 106, 106, 106);
            int lx = ii * 106;
            int ly = jj * 106;
            int rx = lx + 106;
            line(lx, ly, lx + 106, ly + 106);
            line(rx, ly, rx - 106, ly + 106);
            break;
        }
      }
    }
  
    /*fill(0, 0, 0);
    text("mouse(" + mouseX + ", " + mouseY + ")", 10, 200);
    int[] pos = new int[2];
    pos[0] = mouseX;
    pos[1] = mouseY;
    pos = convertToPixel(pos);
    text("mouse(" + pos[0] + ", " + pos[1] + ")", 10, 220);
    */
    
  } else {
    println("\nTie game\n");
    clear();
  }
}

int[] convertToPixel(int[] mouseXY)
{
  int xx, yy;
  int[] pos = new int[2];
  xx = mouseXY[0] / 106;
  yy = mouseXY[1] / 106;
  
  pos[0] = xx;
  pos[1] = yy;
  
  return pos;
}

void mousePressed()
{
  // マウスの左ボタンが押された時の処理
  if (mouseButton == LEFT) {
    int[] pos = new int[2];
    pos[0] = mouseX;
    pos[1] = mouseY;
    pos = convertToPixel(pos);
    // 既に何か置かれているか調べる
    if (field[pos[0]][pos[1]] == 0) {
      field[pos[0]][pos[1]] = 1;
      turn = Player2;
    }
  } else if (mouseButton == RIGHT) {
    int[] pos = new int[2];
    pos[0] = mouseX;
    pos[1] = mouseY;
    pos = convertToPixel(pos);
    field[pos[0]][pos[1]] = 2;
  }
}

// AI処理
// 置く場所がなければtrueを返す
boolean ai()
{
  if(countEmpty() > 0) {
    // とりあえずランダム
    int xx, yy;
    xx = yy = 0;
    do {
      xx = int(random(FLD_WIDTH));
      yy = int(random(FLD_HEIGHT));
      //println("select : " + xx + ", " + yy);
    } while(field[xx][yy] != 0);
    
    // マスに石を置く
    field[xx][yy] = 2;
    turn = Player1;
    return false;
  }
  
  return true;
}

// フィールド上の空きマスの数を返す
int countEmpty() {
  int cnt = 0;
  for(int ii = 0; ii < FLD_WIDTH; ++ii) {
    for(int jj = 0; jj < FLD_HEIGHT; ++jj) {
      if(field[ii][jj] == 0) cnt++;
    }
  }
  
  return cnt;
}

// ゲームクリア判定
// 0 : 勝負続行
// 1 : Player1 勝利
// 2 : Player2 勝利
int isClear()
{
  int ii, jj;
  for(ii = 0; ii < FLD_WIDTH; ++ii) {
    // 縦判定
    if ((field[0][ii] != 0) && (field[0][ii] == field[1][ii]) && (field[0][ii] == field[2][ii])) {
      if (field[0][ii] == 1) return 1;
      else if(field[0][ii] == 2) return 2;
    }
    // 横判定
    if ((field[ii][0] != 0) && (field[ii][0] == field[ii][1]) && (field[ii][0] == field[ii][2])) {
      if (field[ii][0] == 1) return 1;
      else if(field[ii][0] == 2) return 2;
    }
  }
  // 斜め判定
  if ((field[0][0] != 0) && (field[0][0] == field[1][1]) && (field[0][0] == field[2][2])) {
      if (field[0][0] == 1) return 1;
      else if(field[0][0] == 2) return 2;
   }
   if ((field[0][2] != 0) && (field[0][2] == field[1][1]) && (field[0][2] == field[2][0])) {
      if (field[0][2] == 1) return 1;
      else if(field[0][2] == 2) return 2;
   }
  
  return 0;
}

// すべてのマスを0で初期化
void clear()
{
  int ii, jj;
  // Field変数初期化
  for (ii = 0; ii < FLD_WIDTH; ++ii) {
    for (jj = 0; jj < FLD_HEIGHT; ++jj) {
      field[ii][jj] = 0;
    }
  }
  // 表示フラグをOFFに
  winFlag = false;
  // Player1の順番に設定
  turn = Player1;
}

