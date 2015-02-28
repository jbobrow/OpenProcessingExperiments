
class drawChar {
  char alphabet;
  int xpos;
  int ypos;
  int rDegree;
  int rDirection;
  boolean hit;
  color fillColor;
  drawChar(char c, int x, int y) {
    alphabet = c;
    xpos = x+30;
    ypos = y+25;
    rDegree = 0;
    fillColor = color(255);
  }
  void draw() {
    pushMatrix();
    translate(xpos, ypos, 0);

      rotateX(radians(rDegree));
      rotateY(radians(rDegree));
      rotateZ(radians(rDegree));

    if (hitTest() == true) {
     
      update();
    }
    fill(fillColor);
    text(alphabet, 0, 0);
    popMatrix();
  }
  void update() {
    rDegree+=10;
  }
  boolean hitTest() {
    if (dist(mouseX, mouseY, xpos, ypos) <= 40) {
      return true;
    }
    else return false;
  }
  void mousePressed(){
    
      //fillColor = color(random(255), random(255), random(255));

  }
}


