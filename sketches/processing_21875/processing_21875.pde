

class Light {         // define class name

  float xpos;
  float ypos;
  float yspeed;
  color c;  
  

  // The Constructor is defined with arguments.
  // constructor is called when the object is created
  Light(float tempx, float tempy, float tempspeed, color tempC) {
 
    println("start to fulminate");
    xpos = tempx;    // put passed values into class variables
    ypos = tempy;
    yspeed = tempspeed;
    c = tempC;

  }

  void display() {
    noStroke();
    fill(c);
    triangle(xpos+15,ypos-55,xpos-2,ypos+14,xpos-10,ypos+3);
    triangle(xpos,ypos,xpos+10,ypos+6,xpos-24,ypos+75); 
    
     // draws a lightning
  }

  void storm() {              
   ypos = ypos + yspeed;
    if (ypos > 300) {
      ypos = 0;
    }
    
 
  }
}


