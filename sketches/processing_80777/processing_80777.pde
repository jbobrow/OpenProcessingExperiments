
class Light {
  //fields
  float angle; 
  int state; 
  float r = 180;

  // 0 normal, white
  // 1 bite, red
  // 2 safe, blue

  //constructor
  Light(float a) {
angle = a;
 

    state=0;
  }
    
  
  //methods
  //draw method
  void draw() {
    switch(state) {
    case 0:
      fill(255);
      break;
    case 1:
      fill(#FF0000);
      break;
    case 2:
      fill(#4B00FF);
      break;
    }
//setting the light color change, code by Brad Borevitz
    pushMatrix();
    rotate(angle);
    
    translate(r,0);
    rotate(PI/2);
    quad(-10, -20, -20, 20, 20, 20, 10, -20);
    popMatrix();
  }
     }


