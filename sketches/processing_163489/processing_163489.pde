
//hi paul, none of this is working (and I missed a bunch during EOE), but here it is anyway.

int x=0;
int y=0;
int mx=3;
int my=3;
int y1=150;
int p1Score=0;
int p2Score=0;

void setup() {
  size(700, 600);
  frameRate(100);
}
void draw() {
  drawBackground();
  paddleB(width-10, y1);
  paddleA(10, mouseY); 
  ellipse(x, y, 10, 10);
  x+=mx;
  y+=my;

  if (y>height||y<0) {
    my=my*(-1);
  }
  if (x>width) {
    mx=mx*(-1);
    x=width/2;
    y=width/2;
    p1Score+=100;
  }
  if (x<0) {
    mx=mx*(-1);
    x=width/2;
    y=width/2;
    p2Score+=100;
  }
}
void paddleA (int x, int y) {
  int z=0;
  fill(0);
  rect(30, mouseY, 10, 70);
  if (abs(x-30)<40 && abs(y-mouseY)<40) {
    mx=abs(mx);
  }
}
void paddleB (int x, int y) {
  int z=0;
  fill(0);
  rect(width-30, mouseX, 10, 70);
  if (abs(x-(width-30))<40 && abs(y-mouseY)<40) {
    mx=abs(mx);
    println("hit");
  }
}




void KeyPressed() {
  if (key=='w') {
    y1=y1-10;
    if (key=='s') {
      y1=y1+10;
    }
  }
}

void drawBackground() {
  background(255);
  textSize(20);
  fill(150);
  text(p1Score, 150, 20);
  text(p2Score, width-150, 20);
}
