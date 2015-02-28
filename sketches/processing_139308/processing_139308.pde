
void setup() {
  size(800, 800);
  
    
}
  
void draw() {
  background(255);
  noStroke();
  fill((20), (100), (135), (45));
  
    
  if(mousePressed == true) {
    arc(400, 400, 400, 400, PI/4, PI);
     
  }
  else {
    arc(400, 400, 400, 400, -PI, PI/4);
  }
}
