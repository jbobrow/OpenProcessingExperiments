
class Smiley {
  float x;
  float y;
  float scalar;
  float fillColor;
  float mouthWidth = 50;
  float mouthMovement = random(1, 5);
  float speed = random(1, 4);
  
  Smiley(float x_in, float y_in, float scalar_in, float fillColor_in) {
    x = x_in;
    y = y_in;
    scalar = scalar_in;
    fillColor = fillColor_in;  
  }
  
  void move() {
    x += random(-speed, speed); 
    x = constrain(x, 0, width);
    y += random(-speed, speed);
    y = constrain(y, 0, height); 
  }
  
  void display() {
    pushMatrix();
      translate(x, y);
      scale(scalar);  
      noStroke();
      fill(0);
      ellipse(0, 0, 100, 100);
      fill(fillColor);
      ellipse(-20, -10, 15, 15);
      ellipse(20, -10, 15, 15); 
      triangle(0, -10, 10, 10, -10, 10);
      arc(0, 20, mouthWidth, 25, 0, PI);  
    popMatrix();
  }
  
  void moveMouth() {
   mouthWidth += mouthMovement; 
   if(mouthWidth < 5 || mouthWidth > 50) {
     mouthMovement = - mouthMovement;
   }
  }
  
}

