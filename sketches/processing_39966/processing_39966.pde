
void setup () {
  size (720, 680);
frameRate(30);
}


void draw () {
  background(0);
  noStroke();
  for (int i=30; i<width; i=i+60) {
    for (int y=0; y<height; y=y+40) {
      fill (mouseX, mouseX,mouseY);
      triangle (i, y, i-30, y+40, i+30, y+40);
      smooth();
      fill (0, i/2, y/3);
      ellipse(i, y+25, 27, 27);
      smooth();      
    }
  }
}

                
