
void setup(){
  size(500,500);
  background(100);
  smooth();
  noStroke();
}

void draw(){
  float x=(pmouseX-mouseX);
  fill(x*5,x*2,x*2,150);
  float a= (pmouseX-mouseX)+(pmouseY-mouseY);
  ellipse(mouseX,mouseY,a,a);
}

