
/*
*@desc Pattern 14
*interactive loop
*/

void setup() {
  background(255);
  size(600,600);
}

void draw() {
  noFill();
  background(255);
  for (int y=0; y<height; y+=10) {
    beginShape();
    for (int x=0; x<30; x++) {
      float xx = mouseX;
      float xpos = (x/20.0)*xx;
      //use mod as rate
      float ypos = y+((y%40)*2)/10*(x%2)*mouseY;
      vertex(xpos, ypos);
    }
    endShape();
  }
}


