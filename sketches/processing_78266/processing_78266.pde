
void setup() {
// Set the size of the window
size(400,400);
frameRate(30);
}
 
void draw() {
background(255);
  
  ellipseMode(CENTER);
  rectMode(CENTER);
   
  stroke(0);
    fill (255,0,255);
  ellipse (mouseX,mouseY,100, 100);
   
  strokeWeight(3);
  fill(mouseX,0,0);
  ellipse(mouseX-20,mouseY-20, 10, 10);
  ellipse(mouseX+20,mouseY-20,10, 10);
  ellipse(mouseX,mouseY+20,30, 10);
  fill(0,255,0);
  rect(mouseX,mouseY,10,10);
  

}
 
void mousePressed() {
  background (0,255,0);
}
