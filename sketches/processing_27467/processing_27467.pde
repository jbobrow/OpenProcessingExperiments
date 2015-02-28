
void setup() {
  size(200,200); //set 200x200 canvas
  smooth(); //set anti-aliasing
}

void draw() {
  background(0); //set background colour: black
  if (mouseX < width/2) { // is mouseX valuse is less than half of the width
    fill(255); //set rectangle colour: white
    rect(0,0,width/2,height); //draw rectangle
  }
  else {
    fill(255);
    rect(100,0,width/2,height);
  }
    /*
     the below can also be done by the code above:
     if (mouseX > width/2) {
     fill(255);
     rect(100,0,width/2,height);
     }
     
     */
  }


