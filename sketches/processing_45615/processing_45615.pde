
void setup(){
  background(255);
  size(600,400);
  smooth();
  
}
void draw(){
}

void mouseDragged(){
  line(pmouseX,pmouseY,mouseX,mouseY);
  strokeWeight(2);
  fill(255,0,0);
  ellipse(pmouseX,pmouseY,10,10);
}

