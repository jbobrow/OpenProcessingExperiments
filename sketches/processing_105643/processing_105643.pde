
void setup() {
  size (1000,1000);
  smooth();
  frameRate(60);
}

int dx = 2;
int dy = 3;

int x = 50;
int y = 50;

void draw() {
  background(255,255,255);
  fill(255);
  ellipse(x,y,25,25);
  
  x = x + dx;
  y = y + dy ;
  
  if( x < 0 || x > 475){
    dx = -1 * dx;
  }
  if( y < 0 || y > 475){
    dy = -1 * dy;
  }
}
