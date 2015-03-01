
void setup() {
  size(400,400);
  background(255);
}
void draw() {
  stroke(0,
  map(mouseX,0,400,0,255),
  map(mouseY,0,400,0,255));
strokeWeight(map(pmouseX,0,400,0.25,2));  
  line(mouseX,mouseY,50,50);
}  
  
  


