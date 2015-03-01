
int x=0;
int y=0;
int my= 3;
int mx=3;
int p2Y= 200;

int p1Score = 0;
int p2Score = 0;

void setup () {
  size (600, 400);
}
void draw () {
  drawBackground();
  ellipse(x, y, 10, 10);
  x += mx;
  y =+ my;
  if (y> height||y<0) {
    my = my *-1;
  }
  if (x > width ) {
    mx *= -1;
    x = width/2;
    y = height/2;
    p1Score += 100;
  }
  if (x > 0 ) {
    mx *= -1;
    x = width/2;
    y = height/2;
    p1Score += 100;
  }
  if ( x < 0) {
    paddle (50, mouseY);
    paddle (550, p2Y);
  }
  //hit test!
  if (abs(x-50)<40 && abs(y-mouseY)<40) {
    mx =abs(mx);
  }

  //hit test for second paddle!
  if (abs(x-550)<10 && abs(y-p2Y)<40) {
    mx = -abs (mx);
  }
}
// Keyboard Input for Player 2!
void keyPressed() {
  if (key == 'w') {
    p2Y=p2Y+15;
  }
}
void paddle (int x, int y) {
  //Paddle
  rectMode(CENTER);
  rect(x, y, 10, 80);
}
//Draws background lines
void drawBackground() {
  stroke(255);
  strokeWeight(2);
  fill(50);
  line(0, 50, width, 50);
  line(0, 350, width, 350);
  line(width/2, 50, width/2, height-50);
  ellipse(width/2, height/2, 100, 100);

  fill(255);
  textSize(20);
  text(p1Score, 150, 20);
  text(p2Score, width-150, 20);
}

