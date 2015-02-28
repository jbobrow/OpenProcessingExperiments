

void setup () {
  background(255);
  size (400, 400);
  smooth();
  strokeWeight(50);
  colorMode(RGB, 100);
   int space=105;
/* 
  int trX1 = 1;
  int trX2 = 15;
  int trX3 = 22;
  int trY1 = 3;
  int trY2 = 24;
  int trY3 = 11;*/

for ( int y = 35; y < height; y = y + space) {
  for ( int x = 35; x < width; x = x + space  ) {
    stroke(255,34,0);
    triangle( x, y, x, y, y, x);
    
  }
}
}

void keyPressed() {
  saveFrame ("PUNKTEGITTER_RANDOM.png");
}




