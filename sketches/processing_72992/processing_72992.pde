
float x=200;
float y=200;
float xVel=3;
float yVel=random(3);
float p1vel = 0;
int p1y = 0;
float p2vel = 0;
int p2y = 0;
int score1 = 0;
int score2 = 0;
PFont font;

void setup() {
  size(400, 400);
  noStroke();
}

void draw() {

  background(0);
  ball();
  paddle1();
  paddle2();
}

void ball() {
  fill((x/width)*255,0,255-((x/width)*255));
  rect(x, y, 15, 15);
  fill(255);

  if (x>width-45 && (y>p2y-30 && y<p2y+30) && xVel > 0) {
    xVel=xVel*(-1);
    yVel+=p2vel;
  }
  
    if (x>width) {
    xVel=xVel*(-1);
    score1 += 1;
  }

  if (x<30 && (y>p1y-30 && y<p1y+30) && xVel < 0) {
    xVel=xVel*(-1);
    yVel+=p1vel;
  }
  
  if (x<0) {
    xVel=xVel*(-1);
    score2 += 1;
  }

  if (y>height-15) {
    yVel=yVel*(-1);
  }

  if (y<0) {
    yVel=yVel*(-1);
  }

  x+=xVel;
  y+=yVel;
}

void paddle1() {
  fill(0,0,255);
  rect(15, p1y-30, 15, 60);
  
  if (y<p1y) {
     p1vel -= .1; 
  } else {
   p1vel += .1; 
  }
  
  if (p1vel > 3) p1vel = 3;
  if (p1vel < -3) p1vel = -3;
  p1y+=p1vel;
}

void paddle2() {
  fill(255,0,0);
  rect(400-30, p2y-30, 15, 60);
    if (y<p2y) {
     p2vel -= .2; 
  } else {
   p2vel += .2; 
  }
  
  if (p2vel > 5) p2vel = 5;
  if (p2vel < -5) p2vel = -5;
  p2y+=p2vel;

}

void score()
{
stroke(204, 102, 0);
font = loadFont("LetterGothicStd-32.vlw");
textFont(font);
text("word", 10, 30); 
fill(0, 102, 153);
text("word", 10, 60);
fill(0, 102, 153, 51);
text("word", 10, 90); 
}

