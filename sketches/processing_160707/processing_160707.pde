
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/159726*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
void setup() {
  size(640, 480);
  background(255);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  
  // check if the mouse button is down
  if (mousePressed) {
    
    // declare color variable and set to 
    // random greyscale and random alpha channel
    color col = color(random(0), random(255), random(255));
    
    // set fill to col variable
    fill(col);
    
    // declare x and y variables and set to
    // a random value within 50 pixels of the mouse
    float x = random(mouseX-10,mouseX+10);
    float y = random(mouseY-10,mouseY+10);
    
    // draw a rectangle
    ellipse(x, y, 25, 25);
  }
}



