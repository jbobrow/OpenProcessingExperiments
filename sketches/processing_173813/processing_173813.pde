
int a;
int b;
int c;
int d;

void setup()

{
  size(1200, 620);
  frameRate(30);
  d=0;
  }

void draw()

{
  background(0);
  c=0;
  
  strokeWeight(3);
  a=mouseX;
  b=mouseY;
  for (int y=0; y<50; y=y+1) {
    c=c+12;
    if (y==26) {
      c=0;
    }
    if (y>25) {
      d=255;
      stroke(c, 0, d);
    } else {
      stroke(200, 127, c);
    }
  
    line(600, 12*y, a, b);
    
  }
  
}
