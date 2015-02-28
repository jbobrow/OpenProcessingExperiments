
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com


void setup() {
  // Example 2-1: Zoog again
  size(400, 400);  // Set the size of the window
  //background(255);  // Draw a black background 
  smooth(); 

  // Set ellipses and rects to CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  noCursor();
}

void draw() {
  background(255);
  
  // Draw Zoog's body
  stroke(0);
  fill(150);
  rect(mouseX, mouseY+30, 20, 100);

  // Draw Zoog's head
  fill(255);
  //ellipse(100,70,60,60); 
  ellipse(mouseX, mouseY, 60, 60);

  // Draw Zoog's eyes
  fill(0); 
  ellipse(mouseX-19, mouseY, 16, 32); 
  ellipse(mouseX+19, mouseY, 16, 32);

  // Draw Zoog's legs
  stroke(0);
  line(mouseX-10, mouseY+80, pmouseX-20, pmouseY+190); // left leg
  line(mouseX+10, mouseY+80, pmouseX+20, pmouseY+190); // right leg
}


