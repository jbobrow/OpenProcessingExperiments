
int mouseMovement;
boolean drawing = false;

void setup() {
  size(250, 250);
  background(#ffc7b6);
  smooth();
 
// speed of subject 
 
frameRate(5);
}

//moving subject

void draw() {
mouseMovement = abs(mouseX-pmouseX);
  noStroke();
  fill(random(0,75),random(0,20),random(0,45),random(0,95));
  strokeWeight(1);
  
// size of subject
ellipse(pmouseX,pmouseY,mouseX,300);
  
}

  void mousePressed () {
  drawing = false; {
  }
  
  // yay !
}


