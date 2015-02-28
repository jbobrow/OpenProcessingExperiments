
int[] n = new int[500];
int x0 = 250;
int y0 = 790;
int a = 0;
int y = 0;
int x = 0;

void setup() {
  size(500,800);
  smooth();
  background(255,255,255);
  for (int i = 0; i < n.length; i++) {
    n[i] = 0;
  }
}

void draw() {
  a = a+1;
  point(250,540);
  if (a < 100000) {
    y = y0;
    x = x0;
    while (y>400) {
      float blabla = random(0,8);
      stroke(0, 0, 0, 100);
      if (blabla <= 1) {
        line(x,y,x+4,y-2);
        x=x+4;
      }
      else if (blabla <= 4) {
        line(x,y,x-4,y-2);
        x=x-4;
      }
      else if (blabla <= 5) {
        line (x,y,x+8,y-2);
        x=x+8;
      }
      else if (blabla <= 8) {
        line(x,y,x,y-2);
        x=x;
      }
      y=y-2;
    }
//    background(255,255,255);
    fill(255,0,0);
    if (x < 500 & x >= 0) {
      rect(x+1, y-3*n[x], -3, -3);
    }
    n[x] = n[x] + 1;
  }
}              
