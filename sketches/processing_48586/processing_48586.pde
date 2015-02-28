
//yi-ting sie
//課程練習：autonomy
//夢境由如許多訊息的傳遞與結合，是即刻與片段的。畫面中透過變化中閃爍的亮綠色，展現由多個資訊拼奏而成的夢境中。
//Sheng-Fen Nik Chien (2011), Complexity - Autonomy, 數位學習平台─數位資訊創作 http://moodle.ncku.edu.tw/course/view.php?id=43022。
//Dave Bollonger (2010), MatrixCA, http://www.openprocessing.org/visuals/?visualID=10206.


int W = 500; //畫面寬度
int H = 500; //畫面高度
int _cellSize = 5;//格數
int mode=1; //活躍變化的模式
int _numX, _numY;
int [][] curr; //這一代的自動機
int [][] prev; //上一代的自動機
color [] palette; // 256 colors調色板
int S = 5; //細胞自動機呈現時的像素大小與比利
int C = 500 / S; //在自動機的列數
int R = 500 / S; //在自動機的行數

//==========================================================================

void setup() {
  size(500, 500);
  frameRate(10);
  _numX = floor(width/_cellSize);
  _numY = floor(height/_cellSize);
  curr = new int[R][C];//這一代的自動機
  prev = new int[R][C];//上一代的自動機
  palette = new int[256];//調色板
  populate();

  for (int i=0; i<256; i++) {
    int g = (int)(pow(i/256.5, 2.5)*256);
    palette[i] = color(g/20, g, g/5);
  }
}

void  populate() {
  for (int r=0; r<R; r++) {
    for (int c=0; c<C; c++) {
      prev[r][c] = curr[r][c] = (int)random(256);
    }
  }
}

//==========================================================================

void draw() {
  update();
  render();
  swap();
}


void update() {
  for (int r=0; r<R; r++) {
    for (int c=0; c<C; c++) {
      int state = curr[r][c];
      int lr = prev[r][(c-1+C)%C] + prev[r][(c+1)%C];
      int tb = prev[(r-1+R)%R][c] + prev[(r+1)%R][c];
      int breed = 0;
      switch(mode) {
      case 1 : 
        breed = (state+10)&0xff; 
        break;
      case 2 : 
        breed = (state+10)&0xff; 
        break; 
      case 3 : 
        breed = (state+10)&0xff; 
        break; 
      case 4 : 
        breed = (state+10)&0xff; 
        break; 
      case 5 : 
        breed = (state+10)&0xff; 
        break; 
      case 6 : 
        breed = (state*20)&0xff; 
        break; 
      case 7 : 
        breed = (state*20)&0xff; 
        break;
      }
      curr[r][c] = (tb==0) ? breed : (lr%tb)&0xff;
    }
  }
}


void render() {
  for (int r=0,y=0; r<R; y+=S,r++) {
    for (int c=0,x=0; c<C; x+=S,c++) {
      fill(palette[curr[r][c]]);
      rect(x, y, S, S);
    }
  }
}


void swap() {
  int [][] temp = curr;
  curr = prev;
  prev = temp;
}



void mousePressed() {//滑鼠每點畫面就重跑一便
  populate();
}


void keyPressed() {  
  saveFrame("Homework Dream002.jpg");
}


