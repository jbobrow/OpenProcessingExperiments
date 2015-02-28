
void setup() {
  size(300, 300);
  background(0);
  smooth();
}
  
void draw() {
  stroke(255,20,100);
  strokeWeight(mouseX / 200);
  
 
  line(mouseX, mouseY, 50-mouseX,  mouseY);
  line(mouseX, 300-mouseY, 300-mouseX,  mouseY);
  //line(50-pmouseX, mouseY, mouseX,  mouseY);
   
   
  ellipseMode(CENTER);
  ellipse(300-pmouseX,300- pmouseY,300 - pmouseX,300 - pmouseY);
  ellipseMode(CORNER);
  fill(255-mouseY,100-mouseY,255-mouseX,255-mouseY);
  ellipse(mouseX,mouseY, mouseX, mouseY);
 
}

