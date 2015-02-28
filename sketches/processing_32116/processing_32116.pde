
int x1 = 0;
int y1 = 0;
int x2 = 0;
int y2 = 1000;

int bx1 = 500;
int by1 = 0;
int bx2 = 500;
int by2 = 1000;

void setup(){
  size(500,1000);
  background(0);
}

void draw(){
  while(x1<1500){
  strokeWeight(8);
  stroke(255,0,0, 50);
  line(x1, y1, x2, y2);
  x1 = x1+30;
 // y2 = y2+20;
  strokeWeight(8);
  stroke(255,0,0, 50);
  line(bx1, by1, bx2, by2);
  bx1 = bx1-30;
  }
}
