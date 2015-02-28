
/* logical operators in use in a simple sketch, && is AND
 || is OR */

void setup() {
  size(200,200); //200x200 canvas
  smooth(); //set anti-aliasing
}

void draw() {
  background(255); //set backgroudn white
  if (mouseX > width/2 && mouseY > width/2) {  //if mouse X coord is on the right AND the mouse Y coord is on the bottom half of the canvas
    fill(0); //fill rect with black
    rect(width/2,height/2,width/2,height/2); //draw rect at bottom right
  } 
  else if (mouseX < width/2 || mouseY < height/2) { //else if the mouse X coord is less than half of the width OR the mouse Y coord is above the middle of the canvas
    background(0); //fill background with black
    fill(255); //fill rectangle with white
    rect(width/2,height/2,width/2,height/2); //draw rect at bottom right
  }
}

