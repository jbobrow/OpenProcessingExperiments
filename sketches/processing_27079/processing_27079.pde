
class Ball {
  // attributes
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float mysize;
 
  // constructor
  Ball() {
    c = (255);
    xpos = (mouseX);
    ypos = (mouseY);
    xspeed =random(-4,4);
    yspeed = random(-4,4);
    mysize = random(10,30);
  }
  
  // methods (behavior)
 
  void move() {
    if (xpos+(mysize/2) > 500 ){
      xspeed = xspeed * (-1);
      chime1.loop(0);
       }
       
   if (xpos-(mysize/2) < 0 ) {
      xspeed = xspeed * (-1);
      chime2.loop(0);
       }
    if (ypos+(mysize/2) > 500){
      yspeed = yspeed * (-1);
      chime3.loop(0);
    }
   
   if (ypos-(mysize/2) < 0) {
        yspeed = yspeed * (-1);
      chime4.loop(0);
    }
     
    xpos += xspeed;
    ypos += yspeed;
  }
  
  void display() {
    fill(c);
    ellipse(xpos, ypos, mysize, mysize);
  }
}

