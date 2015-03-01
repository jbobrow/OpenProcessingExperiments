
float maxX, maxY;

void setup() {
  size(640, 640);
  /* Play around with the colors or take out stroke() */
  stroke(0, 200, 200);
  fill(0, 200, 200, 50);
}

void draw() {
  background(0);
  
  /* Maximum length the pattern can reach is the width and height of the screen */
  maxX = 360/width*mouseX;
  maxY = 360/height*mouseY*2;
  
  translate(width/2, height/2);
  for (int i = 0; i < 360; i+=36) {
    /* Using the formular to create a cirlce effect */
    float x = sin(radians(i)) * maxX;
    float y = cos(radians(i)) * maxX;
    for (int q = 0; q < 360; q+=36) {
      float x2 = sin(radians(q)) * maxY;
      float y2 = cos(radians(q)) * maxY;
      
      /* Works the same as a bezier(). But with curve() we can create the glow effect from filling in the curve. */
      curve(x/2, y/2, x, y, x2/2, y2/2, x2*2, y2*2);
    }
  }
}


