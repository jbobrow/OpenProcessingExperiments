
class Alien {        
  
  float xpos;
  float ypos;
  float xspeed;
 
  Alien(float tempx, float tempy, float tempspeed, color tempC) { 
   
   xpos = tempx;    
   ypos = tempy;
   xspeed = tempspeed;
   
  }

  void display() {
    noStroke();
    fill(169, 250, 41);
    rectMode(CENTER);
    ellipse(xpos, ypos, 40, random(80)); // draws a circle
  }

  void fly() {            
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}

