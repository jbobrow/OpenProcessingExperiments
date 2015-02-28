

int r = 0;
int g = 0;
int b = 0;

void setup() {
  size( 500, 600 );
  //smooth();
    fill(16, 115, 14);
}

void draw() {
 // background( 12, 20, 9 );

  for (int x = 0; x <= width; x += 15) {
    r += 4;
    g += 90;
    for (int y = 0; y <= height; y+= 6) {
      b += 0; 
      stroke( r, g, b );
      rect(x, y, 19, 15);
      ellipse(x, y, 15, 12);
    }
  }
  
  
  r = 0;
  g = 0;
  b = 0;
}






