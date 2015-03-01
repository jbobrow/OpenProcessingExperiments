
int cell = 15;  
float s = 0;

void setup() {
  size(500, 500);
  colorMode(HSB);
  smooth();
  noStroke();
}

void draw() {
  background(0);
  ellipseMode(CORNER);
  
  for (int j = 0; j < height/cell; j++) {
    for (int i = 0; i < width/cell; i++) {
      
      //random formula here :D i tried sin,cos,tan
      if ( sin(j) - cos(i) + tan(s) >= 0 ) {
        fill(i/2, 255, 255);
      } else {
        fill(50);
      }

      ellipse(i*cell, j*cell, cell, cell);
    }
  }
  //just so it moves
  s = s - 0.05;
}



