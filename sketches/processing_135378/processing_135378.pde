
void setup() {
  background(random(50),100,125);
  size(600,600);
}
 
void draw() {
   
  stroke(255);
  fill(mouseX/2,250,100,100);
  line (mouseY, mouseX,pmouseX,pmouseY);
  stroke(380,20,18);
  ellipse(random (width), random(height),3,3);
  ellipse(mouseX,mouseY,150,50);
  
}
