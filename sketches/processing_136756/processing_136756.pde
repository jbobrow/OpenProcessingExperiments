
float d=20;

void setup() {
  size(500, 500);
  background(255);
  noFill();
  stroke(15, 161, 84, 150);
}
void draw() {
  //background(0);
  ellipse(mouseX, mouseY, d, d);
  if(mousePressed){
  d++;
}
}

void mouseReleased(){

 d=20;
  
}


