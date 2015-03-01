
void setup () {
  size(800, 600);
}


void draw() {
  if (mousePressed) {
    background (0);
  }
  else { 
    background (255);
  }

  ellipse ( width/2, height/2, 50, 50);
  fill(0, 0, 255);
  stroke (0, 0, 255);
}

