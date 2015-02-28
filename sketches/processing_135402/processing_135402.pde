
void setup(){
  size(600,600);
  background(0);
}
void draw(){
  ellipse(mouseX,mouseY,50,50);
  noStroke;
  fill(random(255),random(255),random(255),random(255));
}

