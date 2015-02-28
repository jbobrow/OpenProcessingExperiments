
void setup() {
  size(300, 300);
  background(0);
  smooth();
}
 
void draw() {
  stroke(0,20,100);
  strokeWeight(mouseX / 200);
 

  line(mouseX, mouseY, 50-mouseX,  mouseY);
  line(mouseX, mouseY, mouseX,  50-mouseY);
  line(50-mouseX, mouseY, mouseX,  mouseY);
  
  
  ellipseMode(CENTER);
  ellipse(300-pmouseX,300- pmouseY,300 - pmouseX,300 - pmouseY);
  ellipseMode(CORNER);
  fill(255-mouseY,100-mouseY,255-mouseX );
  ellipse(mouseX,mouseY, mouseX, mouseY);

}




