

class Bird {        
  
  float xpos;
  float ypos;
  float xspeed;
  color c;         


  Bird(float tempx, float tempy, float tempspeed, color tempC) { 
   
   colorMode(HSB,100);
   xpos = tempx;   
   ypos = tempy;
   xspeed = tempspeed;
  
  }

  void display() {
    
    ellipse(xpos,ypos,10,random(60));
    noStroke();
    fill(random(10));
    triangle(xpos,ypos,xpos+30,ypos-10,xpos-40,ypos+30);
    
  }

  void drive() {             
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}

