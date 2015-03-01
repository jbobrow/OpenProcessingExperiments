
/*

 noodles
 
 */

int x=0;
int y=0;
int my= 3;
int mx=3;
//my= how much moving on y axis
//mx= how much moving on x axis
int P2Y = 200;

int p1Score = 0;
int p2Score = 0;

void setup() {
  size (600, 400);
}

void draw () {
  drawBackground();
  fill(0);
  ellipse(x, y, 10, 10);
  x+= mx;
  y+= my;
  if (y>height|| y<0) {
    my *= -1;
  }
  if (x>width) {
    mx *= -1;
    x=width/2;
    y = height/2;
    p1Score += 10000;
  }
  if (x<0) {
    mx *= -1;
    x=width/2;
    y = height/2;
    p2Score += 100;
  }
  paddle( 40, mouseY);
  paddle(560, P2Y);

  if ( abs(x-40)<10 && abs(y-mouseY)<20 ) {
    mx= abs(mx);
  }
  if (abs(x-560)<10 && abs(y-P2Y)<20) {
    mx= -abs(mx);
  }
}

//the soft egg goes to sleep

void keyPressed() {
  if (key == 'w') {
    P2Y -= 1;
  }
  if (key == 's') {
    P2Y += 1;
  }
}

void paddle(int x, int y) {
  fill(0);
  rectMode(CENTER);
  rect(x, y, 10, 40);
}

void drawBackground() {
  background(0);
  stroke(255);
  strokeWeight(2);
  line(0, 50, width, 50);
  line(0, height-50, width, height-50);
  noFill();
  ellipse(width/2, height/2, 100, 100);
  line(width/2, 50, width/2, 150);
  line(width/2, width/2 + 50, width/2, width/2 - 50);
  ellipse(width/2, height/2, 30, 30);
  line(width/2 - 50, height/2, width/2 - 15, height/2);
  line(width/2 + 50, height/2, width/2 + 15, height/2);

  fill(255);
  textSize(20);
  text(p1Score, 150, 20);
  text(p2Score, width-150, 20);
}

