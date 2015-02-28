
void setup(){ 
  size(400, 400); 
  background(240); 
  smooth(); 
  frameRate(1); 
} 
 
void draw() { 
  float corner = random(200); 
  noFill(); 
  ellipse(random(400), random(400), corner, corner);
  strokeWeight(2); 
  stroke(random(150), random(150), random(150)); 
 
} 
 





