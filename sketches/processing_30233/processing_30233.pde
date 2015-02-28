
// Even though there are multiple objects, we still only need one class. 
// No matter how many cookies we make, only one cookie cutter is needed.
class GraviCar { 
  color c;
  float xpos;
  float ypos;
  float yspeed;
  float gravity = 0.1;
  float bouncefriction= 0.9;
  float h = 10;

  // The Constructor is defined with arguments.
 GraviCar(color tempC, float tempXpos, float tempYpos, float tempYspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos+5;
    yspeed = tempYspeed;
    
  }

  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,20,h);
  }

  void drive() {
    yspeed += gravity;
    ypos+=yspeed;
    
    if (ypos > height-h/2) {
      yspeed *= -bouncefriction;
      ypos = height - h/2; 
    }
      if(ypos<h/2){
      yspeed *= -bouncefriction;
      ypos=h/2;
  }
  }
}

