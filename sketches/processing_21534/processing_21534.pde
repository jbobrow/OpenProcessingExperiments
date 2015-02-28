

class Duck {         // define class name
  
  float xpos;
  float ypos;
  float xspeed;
  color c;         


  // constructor
  Duck(float tempx, float tempy, float tempspeed, color tempC) { 
   
   println("a duck has been created");
   
   xpos = tempx;    // put passed values into class variables
   ypos = tempy;
   xspeed = tempspeed;
   c = tempC;
  }

  void display() {
    stroke(0);
    fill(c);
    ellipseMode(CENTER);
    ellipse(xpos,ypos,80,40);    // draws duck body
    ellipse(xpos+28,ypos-28,40,40);  //draw duck head
    fill(10);
    ellipse(xpos+35,ypos-35,5,5);   //draws eye
    fill(#f68909);
    triangle(xpos+44, ypos-18, xpos+57, ypos-23, xpos+47, 502); // draws beak
    
  }

  void swim() {              // makes duck swim
    xpos = xpos + xspeed;
    if (xpos > 640) {
      xpos = 0;
    }
  }
}

