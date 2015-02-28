
DottedNumber dNum;

void setup() {
  size(400,300);
  colorMode(HSB,360,100,100);
  background(0);
  smooth();
  dNum = new DottedNumber(6);
}

void draw() {
  background(0);
  //
  String y = str(year());
  String mo = str(month());
  String d = str(day());
  String h = str(hour());
  String m = str(minute());
  String s = str(second());
  makeDigitNum(y,  x-100,        20);
  makeDigitNum(mo, x-offset1,   120);
  makeDigitNum(d,  x,           120);
  makeDigitNum(h,  x-offset1*2, 220);
  makeDigitNum(m,  x-offset1,   220);
  makeDigitNum(s,  x,           220);
}

int x = 300;
int offset1 = 120;
int offset2 = 50;

void makeDigitNum(String ts, int xpos, int ypos) {
  for (int i=0; i<ts.length(); i++) {
    if (ts.length() == 1) {
      dNum.makeNumber(0, xpos, ypos);
      dNum.makeNumber(int(str(ts.charAt(i))), xpos+offset2, ypos);
    }
    else {
      dNum.makeNumber(int(str(ts.charAt(i))), xpos+offset2*i, ypos);
    }
  }
}               


class DottedNumber {
  float x, y;
  float ew, eh, diameter;
  float offset;

  //
  DottedNumber(float diameter) {
    this.x = 0;
    this.y = 0;
    this.diameter = diameter;
    this.ew = diameter;
    this.eh = diameter;
    this.offset = 10;
  }

  //
  void makeNumber(int value, float px, float py) {
    if (value >= 0 && value <=9) {
      displayDots(value, px, py);
    }
    else {
      displayDots(10, px, py);
    }
  }
  //
  void displayDots(int pnum, float px, float py) {
    noStroke();
    fill(122,99,99);
    for (int i=0; i<7; i++) {
      for (int t=0; t<4; t++) {
        if (numbers[pnum][i*4 + t] == 1) {
          ellipse (px + offset*t, py + offset*i, ew, eh);
        }
        else {
          ellipse (px + offset*t, py + offset*i, ew/4, eh/4);
        }
      }
    }
  }
}




int[] n0 = {
  1,1,1,1,
  1,0,0,1,
  1,0,0,1,
  1,0,0,1,
  1,0,0,1,
  1,0,0,1,
  1,1,1,1
};
int[] n1 = {
  0,0,0,1,
  0,0,0,1,
  0,0,0,1,
  0,0,0,1,
  0,0,0,1,
  0,0,0,1,
  0,0,0,1
};
int[] n2 = {
  1,1,1,1,
  0,0,0,1,
  0,0,0,1,
  1,1,1,1,
  1,0,0,0,
  1,0,0,0,
  1,1,1,1
};
int[] n3 = {
  1,1,1,1,
  0,0,0,1,
  0,0,0,1,
  1,1,1,1,
  0,0,0,1,
  0,0,0,1,
  1,1,1,1
};
int[] n4 = {
  1,0,0,1,
  1,0,0,1,
  1,0,0,1,
  1,1,1,1,
  0,0,0,1,
  0,0,0,1,
  0,0,0,1
};
int[] n5 = {
  1,1,1,1,
  1,0,0,0,
  1,0,0,0,
  1,1,1,1,
  0,0,0,1,
  0,0,0,1,
  1,1,1,1
};
int[] n6 = {
  1,1,1,1,
  1,0,0,0,
  1,0,0,0,
  1,1,1,1,
  1,0,0,1,
  1,0,0,1,
  1,1,1,1
};
int[] n7 = {
  1,1,1,1,
  0,0,0,1,
  0,0,0,1,
  0,0,0,1,
  0,0,0,1,
  0,0,0,1,
  0,0,0,1
};
int[] n8 = {
  1,1,1,1,
  1,0,0,1,
  1,0,0,1,
  1,1,1,1,
  1,0,0,1,
  1,0,0,1,
  1,1,1,1
};
int[] n9 = {
  1,1,1,1,
  1,0,0,1,
  1,0,0,1,
  1,1,1,1,
  0,0,0,1,
  0,0,0,1,
  1,1,1,1
};
int[] nOff = {
  0,0,0,0,
  0,0,0,0,
  0,0,0,0,
  0,0,0,0,
  0,0,0,0,
  0,0,0,0,
  0,0,0,0
};

int[][] numbers = {n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, nOff};               
