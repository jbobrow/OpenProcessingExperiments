
//setting up the light class
class Light {
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
      fill(255);//white normal
      break;
    case 1:
      fill(#FF0000);//red bite
      break;
    case 2:
      fill(#4B00FF);//safe blue
      break;
    case 3:
      fill(#FF760D);//target orange
      break;
    case 4:
      fill(#00FF00);//target orange
      break;
    }
    //setting the light color change, code by Brad Borevitz
    pushMatrix();
    rotate(angle);
    translate(r, 0);
    rotate(PI/2);
    quad(-10, -20, -20, 20, 20, 20, 10, -20);
    popMatrix();
  }
}


