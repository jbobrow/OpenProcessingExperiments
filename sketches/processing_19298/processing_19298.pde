
/*
potential changes:
export as SVG
export as PNG
etc

*/

int counter; // Declare variable "a" of type int

/* double slash indicates quotes in code//integer counter...int var = something as asterisk slash
*/

void setup() {  //as dynamic/setup function called initially, only once
  size(250, 250);// is the window
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
    /*add one to the counter// Increases the value of an integer variable by 1. Equivalent to the operation i = i + 1. If the value of the      variable i is five, then the expression i++ increases the value of i to 6.*/

  noStroke();// outline

  fill(random(255),100,255,50);// these are the colors inside
  
  if(mousePressed == true) { //add some interaction //Determines if two values are equivalent. 
    ellipse(mouseX, mouseY, mouseX*.1, 20); //mouseX the coordinates of the mouse in X position (left/right) mouseY is up/down
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
