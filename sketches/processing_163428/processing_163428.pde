
int x=0;
int y=0;
int my=3;
int mx=3;
int p1score=0;
int p2score=0;

void setup() {
  size(600, 400);
}

void draw() {
  background(255);
  ellipse(x, y, 10, 10);
  x+=mx;
  y+=my;
  if (x>width) {
    x=width/2;
    y=height/2;
    p1score+=100;
  }
  if (x<0) {
    x=width/2;
    y=height/2;
    p2score+=100;
  }
  if (y>height || y<0) {
    my*=-1;
  }
  if (abs(x-50)<20 && abs(y-mouseY)<20) {
    mx=abs(mx);
  }
  if (abs(x-550)<20 && abs(y-mouseY)<40) {
    mx*=-1;
  }

  Paddle(50, mouseY);

  Paddle(550, mouseY);

  drawBackground();
}
void Paddle(int x, int y) {

  rectMode(CENTER);
  rect( x, y, 10, 100);
}


void drawBackground() {
  fill(255, 0, 170);
  line(0, 100, 600, 100);
  line(0, 300, 600, 300);
  stroke(145, 275, 0);

  text(p1score, 300, 50);
  text(p2score, 500, 50);
}

