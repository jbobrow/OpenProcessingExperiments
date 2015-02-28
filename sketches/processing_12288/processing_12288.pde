
//  Lao De Lozada 
// Sept. 16 1210

/**
 * Click. 
 * 
 * Move the mouse to position the shape. 
 * Press the mouse button to invert the color. 
 */


void setup() {
  size(2000, 2000);
  fill(245);
  background(54,0,45);
}

void draw() {
  //must have two == or it wont work
  if(mousePressed==true) {
    stroke(255,100,55);
  } else {
    stroke(250,190,0 );
  }
  //This controlls the width
  line(mouseX-45, mouseY, mouseX+45, mouseY);
  //This controlls the height.
  line(mouseX, mouseY-25, mouseX, mouseY+25); 
  if(mousePressed==false)
  {
    
                                                         
  }
}

