

void setup () {
  background(255);
  size (400, 400);
  smooth();
  strokeWeight(50);
  colorMode(RGB, 100);
  float space=55;


for ( float y = 35; y < height; y = y + space) {
  for ( float x = 35; x < width; x = x + space  ) {
    stroke(255,34,0);
    point (x , y );
    
  }
}
}

void keyPressed() {
  saveFrame ("PUNKTEGITTER_RANDOM.png");
}




