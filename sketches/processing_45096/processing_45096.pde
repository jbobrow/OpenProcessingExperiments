
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
     
   
}

void update()
{
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
               field[pos[0]][pos[1]] = BLACK;

            }
            isTrig = true;
         } else if(!isLeft && isTrig)
            isTrig = false;
    
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
