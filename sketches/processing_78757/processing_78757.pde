
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

    pushMatrix();
    rotate(angle);
    translate(0, -r);
    quad(-10, -20, -20, 20, 20, 20, 10, -20);
    popMatrix();
  }
}

