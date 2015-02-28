
// Hung Wing Chu 14/09/2013
// reference on processing.org

// Background color changes from white to black
// Click on background to change primitives ellipse or rect
// with left and right mouse buttons

// Press to change the value of the primitives


int x = 255;

void setup() {
  size(500, 500); //set display board size
  frameRate(25);
  noFill();
  strokeWeight(20); //set the thickness of the stroke
  smooth();
}

void draw() {
  background(x);
  x = x - 1;
  if (x < 0) {
    x = 255;
  }
  
  if (mousePressed && mouseButton == RIGHT) {
    stroke(68, 215, 222, 80); 
    rectMode(CENTER);
    rect(width/2, height/2, mouseX, mouseY);
    
  } else if (mousePressed && mouseButton == LEFT) {
    stroke(255, 94, 187, 90); 
    ellipseMode(CENTER);
    ellipse(width/2, height/2, mouseX, mouseY);
    
  } else {
    noFill();
  }
}


