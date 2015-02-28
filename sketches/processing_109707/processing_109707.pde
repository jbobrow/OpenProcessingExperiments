
// Hung Wing Chu_52627887_14/09/2013

int x = 0, y = 250;

void setup() {
  size(500, 500);
  frameRate(30);
  smooth();
}

void draw() {
  // Set background color as white
  background(255);
 
  // Create a moving ellipse in the middle of the display board
  noStroke();
  fill(226, 255, 52, 190); 
  ellipseMode(CENTER);
  ellipse(x, y, width/5, height/5);
  x = x + 1;
  while (x == 500) {
    x = 0;
  }
    
  // Create an ellipse with changing value while mouse moved
  noFill();
  strokeWeight(8); //set the thickness of the stroke
  stroke(255, 94, 187, 200); 
  ellipseMode(CENTER);
  ellipse(width/2, height/2, mouseX - 20, mouseX - 20);
  
  // Create an ellipse with changing value while mouse pressed and moved
  if (mousePressed && mouseButton == LEFT) {
    noStroke();
    fill(68, 215, 222); 
    ellipseMode(CENTER);
    ellipse(width/2, height/2, mouseX + 40, mouseX + 40);
  }
}

// reference on processing.org


