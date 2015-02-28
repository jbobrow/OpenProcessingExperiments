
//Jonah Abramson
//
//8/5/13


void setup() {
  size(490, 550);
  background(0);
  frameRate(60);
}

int dx = 2;
int dy = 3;

int x = 50;
int y = 50;

void draw() {
  background(0);
  fill (255);
  
  for (int i=0; i<4; i++) 
  ellipse(x, y+i*20, 25, 25);
  
  x = x + dx;
  y = y + dy;
  
  if ( x < 0 || x > 475){
    dx = -1 * dx;
  }
  if ( y < 0 || y > 475){
    dy = -1 * dy;
  }
 
  rectMode(CENTER);
  fill(0, 0, 200);
  rect(mouseX, mouseY, 40, 85, 7);
  
}
