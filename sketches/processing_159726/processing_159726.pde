
void setup() {
  size(640, 480);
  background(0);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  
  // check if the mouse button is down
  if (mousePressed) {
    
    // declare color variable and set to 
    // random greyscale and random alpha channel
    color col = color(random(255), random(255));
    
    // set fill to col variable
    fill(col);
    
    // declare x and y variables and set to
    // a random value within 50 pixels of the mouse
    float x = random(mouseX-50,mouseX+50);
    float y = random(mouseY-50,mouseY+50);
    
    // draw a rectangle
    rect(x, y, 50, 50);
  }
}



