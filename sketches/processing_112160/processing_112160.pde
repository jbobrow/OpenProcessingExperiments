

void setup() {
  size( 800, 600 );
  smooth();
  noFill();
}

void draw() {
  background( 0);
    
  for (int x = 0; x <= width; x += 50) {
    for (int y = 0; y <= height; y+=50) {
      stroke(90,190,10);
      ellipse(x, y, 60, 60);
    }
  }
  
   for (int x = 0; x <= width; x += 50) {
    for (int y = 0; y <= height; y+=50) {
      stroke(int(random(0,255)), int(random(0,255)), int(random(0,50)));
      ellipse(x, y, mouseX, mouseY);
    }
  }

}



