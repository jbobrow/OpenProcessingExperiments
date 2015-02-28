
class DotMove {

  float x, y; //calculate wiggling coords
  float targetX; //target that ex and ey are trying to get to
  float targetY;
  int diameter;
  float speed = 1.5;
  float ex, ey; //will keep track of the eased position of the Dot as it tries to go from where it is, to its target
  float ox, oy;
  float easing;
  float logox, logoy;
  
  
  float lx, ly;//line coords

  //constructor
  DotMove(float tempX, float tempY, int tempDiameter) {
    x = tempX;
    y = tempY;
    easing = random(0.008, 0.06);
    ex=x;
    ey=y;
    diameter = tempDiameter;

    //When a particle is born, it will be assigned a "target" pixel inside the nasa logo that would like to get to.
    //I made arrays of all the pixels that are considered "inside the nasa logo" in the main setup.  
    int selector = (int)random(goodXs.length);
    logox = goodXs[selector];
    logoy = goodYs[selector];
  }

  void move() {

    float nx = noise(millis()/60000.0+x) * width*2;
    float ny = noise(millis()/50050.0+y) * height*2;

   
     
      targetX = logox+random(-20,20);
      targetY = logoy+random(-20,20);
  
     
      lx = nx-300;
      ly = ny-300;
    


    ex += (targetX-ex) * easing; //easing
    ey += (targetY-ey) * easing; //easing
  }

  void display() {
    image(crosshair, ex, ey, 10, 10);
    
    stroke(167, 99, 107, 40);
    line(lx, ly, ex+5, ey+5);
    

  }
}



