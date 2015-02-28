
class Tulip {
  float x, y;
  float tilt;
  float angle;
  float scalar;
  color c;
  
  Tulip(int xpos, int ypos, float t, float s) {
    x = xpos;
    y = ypos;
    tilt = t;
    scalar = s / 100.0;
    //added color to the tulips
    c = color(random(155), random(130), 160, 230);
  }
  
  void wobble() {
    tilt = cos(angle) / 4;
    angle += 0.1;
  }
  
  void display() {
    noStroke();
    fill(c);
    pushMatrix();
    translate(x, y);
    rotate(tilt);
    scale(scalar);
    beginShape();
    vertex(0, -20);
    bezierVertex(25, -100, 40,1-65, 40, -40);
    bezierVertex(40, -15, 25, 0, 0, 0);
    bezierVertex(-25, 0, -40, -15, -40, -40);
    bezierVertex(-40, -65, -25, -100, 0, -100);
    endShape();
    
    //Tulip stems
    beginShape(LINES);
    stroke(15, 183, 33);
    vertex (5,-5);
    vertex (200,480);
    endShape();
    popMatrix();
    
    
    
  }
}
    
    

