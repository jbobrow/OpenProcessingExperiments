
// practice with variables 10/02
// by chen-hsin chang

void setup() {
  size(480, 120);
  background(255);
  smooth();
}

void draw() {
  
background(mouseX,200,200);  
  
  if (mousePressed) {
    fill(0, 255, 230);
  } 
  else {
    fill(255,30);
  }

  float centerX= width/2;
  float centerY= height/2;
  
  
  //transparancy changed with mouseY 
  stroke(0, 255, 230, mouseY);
  //create lines from mouse to center
  line(mouseX, mouseY, centerX, centerY);
  //transparancy changed with mouseX 
  stroke(255, 255, 70, mouseX);
  //create rectagle with width and length changed with distance between mouse and center
  rect(mouseX, mouseY,mouseX-centerX, mouseY-centerY);
  
  
  
  
  
}




