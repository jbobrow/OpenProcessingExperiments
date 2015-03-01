
void setup() {
  // Set the size of the window
  size(200,200);
  smooth();
  // The frame rate is set to 30 frames per second.
  frameRate(40);
}
  
void draw() {
  // Draw a white background
  background(255);
 
  // Set ellipses and rects to CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
 
  // Draw Zoog's body
  fill(mouseX,100,mouseY);
  stroke(0);
  rect(mouseX,mouseY,35,35);
 
  // Draw Zoog's head
  stroke(0);
  fill(mouseX,250,mouseY);
  ellipse(mouseX,mouseY-30,60,60);
 
  // Draw Zoog's eyes
  // The eye color is determined by the mouse location.
  fill(mouseX,0,mouseY);
  ellipse(mouseX-19,mouseY-30,16,32);
  ellipse(mouseX+19,mouseY-30,16,32);
 
  // Draw Zoog's legs
  stroke(0);
  // The legs are drawn according to the mouse location and the previous mouse location.
  line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+60);
  line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+60);
  line(mouseX-10,mouseY+50,pmouseX-15,pmouseY+60);
  line(mouseX+10,mouseY+50,pmouseX+15,pmouseY+60);
  line(mouseX-10,mouseY+50,pmouseX-20,pmouseY+60);
  line(mouseX+10,mouseY+50,pmouseX+20,pmouseY+60);
  line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+10);
  line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+10);
}
 
void mousePressed() {
  println("Plz....make it stap");
}
