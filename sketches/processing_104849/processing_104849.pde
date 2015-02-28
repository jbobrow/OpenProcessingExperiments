
int BallHeights = 30;
int BallWidth= 15;
int x = 0;
int y = 0;
int speed = 5;

void setup (){
  size(400, 400);
  smooth();
  
  noStroke();
  ellipseMode(CORNER);
  
}

void draw(){
  background (255);
  fill(255,0,0);
  ellipse(x,y,BallWidth, BallHeights);
  
  x = x + speed;
  y = y + speed;
  
  if((x+BallWidth >= width) || (x<= 0)) {
    speed = speed *-1;
    }
    }
