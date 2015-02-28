
void setup(){
  size(600,600);
  background(0);
}
void draw(){
  line(mouseX,mouseY,300,300);
  stroke(255,255,255);
  ellipse(mouseX,mouseY,80,80);
  fill(random(255),random(255),random(255),random(255));
}

