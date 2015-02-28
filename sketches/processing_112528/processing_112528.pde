
void setup() {
  size(600,600);
}
 
void draw() {
  background(255);
  fill(900,30,10);
  
  translate(width/2,height/2);
   
  float theta = PI*mouseX / width;
   
  rotate(theta);
   
  ellipseMode(CENTER);
  ellipse(150,150,150,150);
}
