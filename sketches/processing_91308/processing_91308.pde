
//Ana Cecilia Thompson 
//Multiple objects
//February 27th



void setup() {
  size(800, 800);
}

void draw() {
  background(0);

//grey lines
  for ( int x = 0; x<width; x+=20) {
    stroke(50);
    line (mouseX, mouseY, x, 0);
  }

  for ( int x = 0; x<width; x+=20) {
    stroke (50);
    line (mouseX, mouseY, x, 800);
  }

  for ( int y = 0; y<width; y+=20) {
    stroke (50);
    line (mouseX, mouseY, 800, y);
  }

  for ( int y = 0; y<width; y+=20) {
    stroke (50);
    line (mouseX, mouseY, 0, y);
  }

  if (mousePressed==true) {
    
    //color lines
    for (int x = 0; x<width; x+=mouseX+10) {
      stroke(255, 0, 0);
      line (mouseX, mouseY, x, 0);
    }

    for (int x = 0; x<width; x+=mouseX+10) {
      stroke(0, 175, 0);
      line (mouseX, mouseY, x, 800);
    }

    for (int y = 0; y<width; y+=mouseY+10) {
      stroke(0, 0, 175);
      line (mouseX, mouseY, 800, y);
    }

    for (int y = 0; y<width; y+=mouseY+10) {
      stroke(255, 255, 0);
      line (mouseX, mouseY, 0, y);
    }
  }
}
