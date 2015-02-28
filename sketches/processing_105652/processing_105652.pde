
void setup() {
  size(1920, 1080);  
  background(0);
  frameRate(999999999);
}

int dx = 2;
int dy = 3;

int x = 50;
int y = 50;

void draw() {
  smooth();
    noStroke();
  fill(255);

  x = x+dx;
  y = y+dy;

  for(int i=0;i<=3;i++)
      rect(x+i*10, y+i*10, 25, 25, 5);

  if ( x< 0 || x > 1900) {
    dx = -1*dx;
  }

  if ( y < 0 || y > 1000) {
    dy = -1*dy;
  }
}
