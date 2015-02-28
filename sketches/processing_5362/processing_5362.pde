
class Ball {

  float r; //radius 
  float x, y; // x and y locations 
  float xspeed, yspeed; //speed
  float varSpeed = 1; 
  int rocet = 1;   


  Ball () {// constructor 

    r = random (5, 25); 
    x = random (width); 
    y = random (40, 55); 
    xspeed = random (-2, 2); 
    yspeed = random (-5, 5);
    float varSpeed = 0; 
    int rocet = 1;  

  }

  void move () {
    x += xspeed; 

    if (x>width || x<0) {
      xspeed *= -1; 
    }

  }


  //  the display function 
  void display() {
    varSpeed = random(- 0.2, 0.2); 
    x = x+xspeed; 
    xspeed = xspeed+varSpeed;
    if (xspeed > 4.) {
      xspeed = 1; 
    }
    stroke(0); 
    fill (0, 50); 
    ellipseMode (CENTER); 
    ellipse (x,y,r*2, r*2); 
  }

  void fire () {

    rocet = rocet+1;
    fill (0); 
    ellipse (x,y+rocet, 3, 3);
    if (rocet>=height-5){

      background (img); 
    }
    if (rocet>=height){
      rocet = 0; 
    }

    }
  }






// rocet = rocet+1;  






