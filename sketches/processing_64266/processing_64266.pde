


void setup () {
  background(255);
  size (400, 400);
  smooth();
  strokeWeight(10);
  
  float space=40;


for ( float y = 15; y < height; y = y + space) {
  for ( float x = 15; x < width; x = x + space  ) {
    point (x + random (10, 50), y + random (10, 50));
  }
}
}

void keyPressed() {
  saveFrame ("punktegitter_wahrscheinlichkeit_enes.png");
}


