
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com


class Rotater {
  
  float x,y;   // x,y location
  float theta; // angle of rotation
  float speed; // speed of rotation
  float w;     // size of rectangle
  
  Rotater(float tempX, float tempY, float tempSpeed, float tempW) {
    x = tempX ;
    y = tempY;
    theta = 1; 
    speed = tempSpeed;
    w = tempW;
  }
  
  void spin() {
    theta += speed;
  }
  

  void display() {
   rectMode(1);
    
    pushMatrix(); 
    translate(280,y);
    rotate(theta);
   smooth(); 
   noFill(); 
   stroke(238, 192, 1);
   beginShape(); 
   curveVertex(200, 10); //c1
   curveVertex(70, 20); //v1
   curveVertex(140, 20); //v2
   curveVertex(200, 380); //c2
   endShape();
    
    popMatrix();
    
  

    
  }
}

