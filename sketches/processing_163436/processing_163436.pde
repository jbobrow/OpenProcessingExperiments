
int x=0;
int y=0;
int my= 3;
int mx=3;
int p1Score =0;
int p2Score=0;
void setup () {
  size (600, 400);
}
void draw() {
  background (50, 0, 220);
  background(50);
  stroke(255);
  strokeWeight (2);
  fill(50);
  noFill();
  rect(-1, 20, 602, 360);
  line(300, 0, 300, 400);
  ellipse(300, 200, 80, 80);
  ellipse(0, 200, 30, 80);
  ellipse(600, 200, 30, 80);
  ellipse (x, y, 10, 10);

  fill(255);
  textSize(25);
  text (p1Score, 150, 20);
  text (p2Score, width-150, 20);

  x+=mx;
  y+=my;
  if (y> height||y<0) {
    my *= my *-1;
  }
  if (x>width) {
    mx*=-1;
    x=width/2;
    y=height/2;
    p2Score +=100;
  }

  if (x<0) {
    mx*=-1;
    x=width/2;
    y=height/2;
    p2Score +=100;
  }
  paddle (50, mouseY);
  paddle (550, mouseY);

  //hit test
  if (abs(x-50)<10 && abs(y-mouseY)<40) {
    mx = abs (mx);
  }
  //hit test
  if (abs(x-550)<10 && abs(y-mouseX)<40) {
    mx = -abs (mx);
  }
}
void paddle (int x, int y) {
  //Paddle
  rectMode(CENTER);
  rect(x, y, 10, 80);
}

