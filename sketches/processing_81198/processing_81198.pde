
void setup() {
  // Set the size of the window
  size(200,200);  
  smooth();
  // The frame rate is set to 30 frames per second.
  frameRate(30);
}

void draw() {
  // Draw a white background
  background(255);  
  
  // Set ellipses and rects to CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER); 
  
  // Draw Robot body
  stroke(10);
  fill(0);
  rect(mouseX,mouseY,20,100);

  // Draw Robot head
  stroke(0);
   fill(mouseX,40,mouseY);
  ellipse(mouseX,mouseY-30,80,80);
  


  // Draw Robot eyes
  // The eye color is determined by the mouse location.
  fill(mouseX,200,mouseY); 
  rect(mouseX-19,mouseY-30,16,23); 
  rect(mouseX+19,mouseY-30,16,23); 
  ellipse(mouseX+0,mouseY-0,15,15); 

  // Draw Robot legs
  stroke(0);
  // The legs are drawn according to the mouse location and the previous mouse location.
  line(mouseX-10,mouseY+10,pmouseX-20,pmouseY+60);
  line(mouseX+10,mouseY+10,pmouseX+20,pmouseY+60);
}

void mousePressed() {
  println("Take me to your leader!"); 
}
//got code from http://www.learningprocessing.com/examples/chapter-3/example-3-6/

