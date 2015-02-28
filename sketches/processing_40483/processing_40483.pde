

class Ghost {
  float x, y;
  float diameter; 
  boolean on = false;
  float angle = 0.0;
  void start(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    on = true;
    diameter = 1;
  }
  void grow() {
    if (on == true) {
      diameter += 1.5;
      if (diameter > 150) {
        on = false;
      }
    }
  }
  void appear() {
    if (on == true) {
      noStroke();
      fill(255, 225, 216, 15);
      pushMatrix();
      translate(x, y);
      angle = angle + 1;
      rotate(angle);
      beginShape();
      vertex(45, 0);
      vertex(-9, 18);
      vertex(-3, 0);
      vertex(-9, -18);
      endShape(CLOSE);
      ellipse(0, 0, diameter, diameter/3);
      popMatrix();
    }
  }
  void travel() {
//    if (on == true) {
//      if (x < width/2 && y < height/2) {
//        x++;
//        y++;
//      }
//      if (x > width/2 && y < height/2) {
//        x--;
//        y++;
//      }
//      if (x < width/2 && y > height/2) {
//        x++;
//        y--;
//      }
//      if (x > width/2 && y > height/2) {
//        x--;
//        y--;
//      }
//    }
      if (on == true && mouseX > width/2) {
        x++;
      } else {
        x--;
      }
  }
}


