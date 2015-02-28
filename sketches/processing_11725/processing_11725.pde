
 void setup () {
  size(1000,1000);
  background(255);
}
 
void draw() {
 
}
void mousePressed() {
  stroke(0);
  fill(random(255));
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,random(1,2),random(1,2));
}
  


