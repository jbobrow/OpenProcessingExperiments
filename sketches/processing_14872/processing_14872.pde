

void setup() {
  size(800,800);
  background(#FFFFFF);
}

void draw() {
  fill(#FFFFFF);
  stroke(#000000);
}

void mouseMoved() {

  rect(pmouseX,pmouseY,random(1,100),random(1,100));
}
void mouseClicked() {
  fill(#9B1014);
  rect(pmouseX,pmouseY,random(1,100),random(1,100));
  
}

