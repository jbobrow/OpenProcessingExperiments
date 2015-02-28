
void setup(){
  size(400,400, P2D);
  smooth();

}

void draw(){
  background(255);
  
  fill(0);
  noStroke();
  rect(0,250,700,650);
  
  fill(255);
  ellipse(width/2,mouseY,420,250);

}
