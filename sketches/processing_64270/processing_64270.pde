

void setup () {
  background(255);
  size (400, 400);
  smooth();
  strokeWeight(10);
  colorMode(RGB, 100);
  float space=40;


for ( float y = 15; y < height; y = y + space) {
  for ( float x = 15; x < width; x = x + space  ) {
    stroke(255,34,0);
    point (x , y );
    
  }
}
}

void keyPressed() {
  saveFrame ("PUNKTEGITTER_RANDOM.png");
}




