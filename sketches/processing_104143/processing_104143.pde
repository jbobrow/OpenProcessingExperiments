
void setup() {
  size(400,400); 
  smooth();
  frameRate(30);
}
 
void draw() {
  background(30); 
  ellipseMode(CENTER);
  rectMode(CENTER);
   
  // Draw Zoog's body
  stroke(0);
  fill(100,230,100);
  rect(mouseX,mouseY,20,150);
 
  // Draw Zoog's head
  stroke(0);
  fill(0,255,0);
  ellipse(mouseX,mouseY-70,100,90);
 
  // Draw Zoog's eyes
  fill(255);
  ellipse(mouseX-30,mouseY-70,40,60);
  ellipse(mouseX+30,mouseY-70,40,60);
   
  // Draw Zoog's pupils
  fill(mouseX,0,mouseY);
  stroke(0);
  ellipse(mouseX-30,mouseY-70,30,50);
  ellipse(mouseX+30,mouseY-70,30,50);
   
  // Draw Zoog's mouth
  smooth();
  strokeWeight(4);
  fill(0);
  ellipse(mouseX,mouseY-31,10,10);
   
  // Draw Zoog's legs
  stroke(0);
  line(mouseX-10,mouseY+75,pmouseX-10,pmouseY+150);
  line(mouseX+10,mouseY+75,pmouseX+10,pmouseY+150);
   
  // Draw Zoog's arms
  stroke(0);
  line(mouseX-10,mouseY-25,pmouseX-25,pmouseY+100);
  line(mouseX+10,mouseY-25,pmouseX+25,pmouseY+100);
}


