
void setup() {
  size(600,600);
}

void draw() {
  background(255);
  stroke(0);
  fill(78,139,92);
  
  translate(width/2,height/2);
  
  float theta = PI*mouseX / width; 
  
  rotate(theta);
  
  rectMode(CENTER);
  rect(0,0,100,100);
}


