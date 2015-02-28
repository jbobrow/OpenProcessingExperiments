

void setup() {
  size(600, 600);
  
  colorMode(HSB, 100);
  background(100);
  smooth();
  noFill();
  
}

void draw() {
  // noFill();
  // stroke(60,50,80,10);
  noStroke();
  //int distance = int (pmouseX-mouseX)-(pmouseY-mouseY);
 
 int cLocation = mouseX + mouseY;
 int pLocation = pmouseX + pmouseY;
 
  fill(cLocation-pLocation, 60, 200, 20);
  rect(mouseX, mouseY, cLocation-pLocation, cLocation-pLocation);
  
  fill(pLocation-cLocation, 60, 200, 20);
  rect(mouseX, mouseY, pLocation-cLocation, pLocation-cLocation);
  

  

 // ellipse(mouseX, mouseY, mouseX-pmouseX, mouseY-pmouseY); 
 
}

// function called when mouse is pressed
void mousePressed() {
  saveFrame("Drawing tool_r.jpg");
  background(100);      // clears the background
  
  
}


