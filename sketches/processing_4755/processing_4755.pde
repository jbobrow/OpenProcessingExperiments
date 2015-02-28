
void setup(){
  size(600,600);
  smooth();
   background(255);
}

void draw(){
  stroke(245,20,0);
  fill(mouseX,mouseX);
  strokeWeight(abs(pmouseX - mouseX));
  ellipse(pmouseX,pmouseY,mouseX,mouseY);
}

