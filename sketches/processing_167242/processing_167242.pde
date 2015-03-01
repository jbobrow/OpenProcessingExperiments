
// SQUARES IN MOVING COLOR AT 1 FPS
float x;
float y;
float w;
float h;
float spacing;

float H;
float S;
float B;
float A;

void setup() {
  frameRate(1);
  size (800, 504);
}

void draw() {
  background (#F7F3F2);
  w = 30;
  h = 30;
  x = 0;
  y = 0;
  spacing = 50;

  for (y = 12.5; y<=height-12.5; y = y + spacing) {  
    for (x = 12.5; x<=width-12.5; x = x +spacing) {
      noStroke();
      fill (random(255), random(255), random(255));
      rect (x, y, w, h);
    }
  }
}


