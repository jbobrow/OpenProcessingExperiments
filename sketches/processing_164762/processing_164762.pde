
int x = 0;
int y = 0;
int my = 3;
int mx = 3;
int p2Y = 200; 

int p1score = 0;
int p2score = 0; 
void setup() {
  size(600, 400);
}

void draw() {
  drawBackground();  
  fill(random(129), random(23), random(8));
  ellipse(x, y, 10, 10);
  x+=mx;
  y+=my;
  if (y > height|| y < 0) {
    my *= -1;
  }
  if (x > width) {
    mx *= -1;
    x=width/2;
    y=height/2;
    p1score += 100;
  }

  if (x < 0) {
    mx *= -1;
    x=width/2;
    y=height/2;
    p2score +=100;
  }
  fill(random(129), random(23), random(8));
  paddle(50, mouseY);
  paddle(550, p2Y);

  //hit test!
  if (abs(x-50)<10 && abs(y-mouseY)<20) {
    mx = abs(mx);
  }
  if (abs(x-550)<10 && abs(y-p2Y)<20) {
    mx = abs(mx);
  }
}
// Keyboard Input for player 2!
void keyPressed() {
  if (key=='w') {
    p2Y = p2Y - 50;
}
}
void paddle(int x, int y) {
  //Paddle 
  rectMode(CENTER);
  rect(x, y, 10, 40);
}
//draw Background
void drawBackground() {
  background(0);
  stroke(255);
  strokeWeight(3);
  fill(50);
  line(0, 50, width, 50);
  line(0, 350, width, 350);
  line(width/2, 50, width/2, height-50);
  fill(random(129), random(23), random(8));
  ellipse(width/2, height/2, 100, 100);

  fill(255);
  textSize(30); 
  text(p1score, 150, 35);
  text(p2score, width-150, 35);
}

