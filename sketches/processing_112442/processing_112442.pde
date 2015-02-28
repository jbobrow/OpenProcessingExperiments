
word[] word = new word[64];
int released = 0;

void setup() {
  size(405, 405);
  smooth();
  for (int i = 0; i<word.length; i++) {
    word[i] = new word(i);
  }
}

void draw() {
  background(0);
  for (int i = 0; i<word.length; i++) {
    if (i == 0) {    
      word[i].write();
    }
    else if (word[i-1].t == 51) {
      word[i].write();
    }
  }
}

//-------------------------------------------------------------------------------------------

void mouseReleased() {
  released = 1;
}

//-------------------------------------------------------------------------------------------

class word {

  float[] wx = new float [100000];  //筆畫座標
  float[] wy = new float [100000];  
  int wnum;                    //序號
  int[] sx = new int [100];  //開頭判斷
  int[] sy = new int [100];  //結尾判斷
  int snum;                    
  int begin;
  int t;                     //送出時間
  float Lx;             //極限座標 
  float Rx;
  float Uy;
  float Dy;
  int start;
  int number;            //物件編號
  float maxx;            //參考框寬度
  float maxy;            //參考框高度  
  float maxl;            //參考框最終邊長
  int p;                 //單點筆畫判斷

  word(int i) {
    number = i;
  }

  void write() {

    if (t == 30) {           //送出
      if (maxx == 0 || maxy == 0) {     //單點
        for (int i = 0; i<wnum; i++) {
          wx[i] = 0;
          wy[i] = 0;
        }
        for (int i = 0; i<snum; i++) {
          sx[i] = 0;
          sy[i] = 0;
        }
        p = 1;
        t = 51;
      }
      else {             //正常筆畫
        for (int i = 0; i<wnum; i++) {
          wx[i] = map(wx[i], (Lx+Rx)/2-maxl/2, (Lx+Rx)/2+maxl/2, 5+50*(number%8), 50+50*(number%8));
          wy[i] = map(wy[i], (Uy+Dy)/2-maxl/2, (Uy+Dy)/2+maxl/2, 5+50*(number/8), 50+50*(number/8));
        }
        t = 51;
      }
    }
    else if (t != 51) {     //手寫中
      if (mousePressed) {   
        start = 1;
        if (begin == 0) {      
          sx[snum] = wnum;
          begin = 1;
        }      
        wx[wnum] = mouseX;
        wy[wnum] = mouseY;

        if (wnum == 0) {         //邊框偵測
          Lx = wx[wnum];
          Rx = wx[wnum];
          Uy = wy[wnum];
          Dy = wy[wnum];
        }

        if (wx[wnum] < Lx) {
          Lx = wx[wnum];
        }

        if (wx[wnum] > Rx) {
          Rx = wx[wnum];
        }

        if (wy[wnum] < Uy) {
          Uy = wy[wnum];
        }

        if (wy[wnum] > Dy) {
          Dy = wy[wnum];
        }

        sy[snum] = wnum;
        wnum++;
        t = 0;
      }
      else if (released == 1) {  
        begin = 0;
        snum++;
        released = 0;
      }
      else {    
        if (start == 1) {
          t++;
        }
      }
    }

    maxx = Rx - Lx;
    maxy = Dy - Uy;      
    maxl =max(maxx, maxy);

    if (t <= 30) {
      strokeWeight(10);
      stroke(0, 255, 255);
    }
    else {
      strokeWeight(1);
      stroke(255);
    }
    if (p == 1) {
      ellipse(22.5+50*(number%8), 22.5+50*(number/8), 10, 10);
    }
    else {
      for (int i = 0; i<=snum; i++) {             //產生手寫圖形
        for (int j = sx[i]; j<sy[i]; j++) {
          line(wx[j], wy[j], wx[j+1], wy[j+1]);
        }
      }
    }
  }
}


