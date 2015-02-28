
color bgcolor;
 
void setup() {
  size(500, 500);
  bgcolor = color(random(255), 100, 255);
  background(bgcolor);
  fill(random(255), 100, 200);
  noStroke();
  ellipseMode(CENTER);
}
 
void draw() {
  background(bgcolor);
  if(dist(mouseX, mouseY, pmouseX, pmouseY) <Radius/2){
  if (mousePressed) {
    cursor(HAND);
    ellipse(mouseX, mouseY, 100, 100);
    isOnNode = true;
  }
  else {
  cursor(HAND);
   ellipse(mouseX, mouseY, 100,100);
     
}
 
}
