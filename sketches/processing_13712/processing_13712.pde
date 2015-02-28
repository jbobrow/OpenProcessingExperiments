
void setup() {
  size(200,200);  
  smooth();
  frameRate(30);
}

void draw() {
  background(120);  
  ellipseMode(CENTER);
  rectMode(CENTER); 
  
  // Draw Zoog's body
  stroke(0);
  fill(255, 0, 0);
  rect(mouseX,mouseY,30,100);

  // Draw Zoog's head
  stroke(0);
  fill(255);
  ellipse(mouseX,mouseY-30,60,60); 

  // Draw Zoog's eyes
  fill(mouseX,0,mouseY); 
  ellipse(mouseX-10,mouseY-40,16,16); 
  ellipse(mouseX+10,mouseY-40,16,16); 
  
  // Draw Zoog's pupils
  fill(255); 
  stroke(0);
  ellipse(mouseX-10,mouseY-40,4,4); 
  ellipse(mouseX+10,mouseY-40,4,4); 
  
  // Draw Zoog's mouth
  smooth();
  strokeWeight(2);
  fill(0);
  ellipse(mouseX,mouseY-20,10,10); 
  
  // Draw Zoog's legs
  stroke(0);
  // The legs are drawn according to the mouse location and the previous mouse location.
  line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+60);
  line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+60);
  
  // Draw Zoog's arms
  stroke(0);
  // The legs are drawn according to the mouse location and the previous mouse location.
  line(mouseX-40,mouseY+10,pmouseX-15,pmouseY+10);
  line(mouseX+40,mouseY+10,pmouseX+15,pmouseY+10);
}

