

int x=0;
int y=0;
int my=3;
int mx=3;
int p2Y = 200;

int p1Score = 0;
int p2Score = 0;

void setup() {
  size(600, 400);
}
void draw() {
  drawbackground();

  fill(0);
  ellipse(x, y, 10, 10);
  x+=mx;
  y+=my;
  if (y>height || y<0) {
    my *= -1;
  }
  if (x>width) {
    mx*= -1;
    x=width/2;
    y=height/2;
    p1Score += 100;
  }
  if (x<0) {
    mx *= -1;
    x=width/2;
    y=height/2;
    p2Score +=100;
  }

  paddle(50, mouseY);
  paddle(550, p2Y);



  //hit test!
  if (abs(x-50)<20 && abs(y-mouseY)<20) {
    mx = abs(mx);
  }
  if (abs(x-550)<20 && abs(y-p2Y)<20) {
    mx = -(mx);
  }
}

//Keyboard Input for Player 2?
void keyPressed() {
  if (key =='w') {
    p2Y = p2Y - 10;
  }

  if (key =='s') {
    p2Y = p2Y + 10;
  }
}




void paddle(int x, int y) {
  //paddle
  fill(255);
  rectMode(CENTER);
  rect(x, y, 10, 40);
}


void drawbackground() {  
  background(255);
  stroke(0, 0, 255);
  fill(255);
  rectMode(CORNER);
  rect(-1, 20, 601, 360);
  line(300, 0, 300, 400);
  stroke(255, 0, 0);
  ellipse(300, 200, 80, 80);
  fill(0);
  textSize(40);
  text(p1Score, 150, 32);
    text(p2Score, 450, 32);


      int x = 0;
  int y = 0;

  while (x<width) {
    while (y<height) {
      fill(0);
      stroke(0);
      ellipse (x, y, 1, 1);
      y=y+10;
    }
    y=0;
    x=x+10;
  }
}

