
//by Michal Piasecki
//press mouse to change the direction of bezier curves

int a = 0;
int b = 0;
boolean whichside = true;

void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  a = mouseX;
  b = mouseY;
  if (whichside == true) {
    bezierc1(a,b);
  } else {
    bezierc2(a,b);
  }
}

void bezierc1(int x, int y){
  stroke(0,200);
  fill(255,5);
  bezier(0,0,x*2,y*2,x+50,y+50,500,500);
}

void bezierc2(int x, int y){
  stroke(0,200);
  fill(255,5);
  bezier(500,0,x*2,y*2,x-50,y-50,0,500);
}

void mousePressed() {
  whichside = !whichside;
}

