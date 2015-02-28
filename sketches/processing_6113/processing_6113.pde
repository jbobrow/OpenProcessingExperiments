
class Ball {
  
  float x, y;
  float diameter;
  float speed;
  float xdirection = 1;
  float ydirection = 1;
  int clr;
  
  //constructor
  Ball(float xpos, float ypos, float dia, float spe) {
    x = xpos;
    y = ypos;
    diameter = dia;
    speed = spe;
    

  }
  
  void move() {
    y += (speed * ydirection);
    x += (speed * xdirection);
    if ((y > 320-diameter/2) || (y < diameter/2)) {
      ydirection *= -1;
    }
    if ((x > 480-diameter/2) || (y < diameter/2)) {
      xdirection *= -1;
    }
    
  }
  
  void displayb() {
    fill(252, 146, 6);
    ellipse(x, y, diameter, diameter);
    pushMatrix();
    translate(x-30, y-50);
    beginShape();
noFill();
curveVertex(44, 50);
curveVertex(44, 30);
curveVertex(34, 50);
curveVertex(44, 70);
curveVertex(44, 60);
endShape();

beginShape();
noFill();
curveVertex(18, 50);
curveVertex(18, 30);
curveVertex(27, 50);
curveVertex(18, 70);
curveVertex(18, 60);
endShape();
  popMatrix();
    }
    
    void displayt() {
    fill(165, 247, 70);
    ellipse(x, y, diameter, diameter);
pushMatrix();
translate(x-19, y-20);
beginShape();
noFill();
curveVertex(25, 18);
curveVertex(25, 12);
curveVertex(21, 20);
curveVertex(25, 27);
curveVertex(25, 21);
endShape();

beginShape();
noFill();
curveVertex(13, 18);
curveVertex(13, 12);
curveVertex(18, 20);
curveVertex(13, 27);
curveVertex(13, 21);
endShape();
popMatrix();
    
    }
    
    
    
}

