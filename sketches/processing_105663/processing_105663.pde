
// Reese Wills
// Bouncy Ball
// 8/5/2013

void setup(){  
  size(500,500);
  background(0);
  frameRate(60);
}

int dx =12;
int dy =10;

int x =75;
int y =100;

void draw(){
  fill(255);
  ellipse(x,y,50,50);

x = x + dx;
y = y + dy;

if ( x< 0 || x > 475){
  dx = -1 * dx;
}
  if ( y < 0 || y > 475) {
    dy = -1 * dy;

  }
}
