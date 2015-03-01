
void setup(){
  size(600,600);
  background(255);
  smooth();
}

void draw(){
  if(mousePressed){
    stickFigure(mouseX, mouseY);
  }
}

void stickFigure(float x, float y){
  //head
  fill(random(255), random(255), random(255));
  ellipse(x, y, 40, 40);
  //body
  stroke(random(255), random(255), random(255));
  line(x, y+20, x, y+60);
  //legs
  stroke(random(255), random(255), random(255));
  line(x, y+60, x+15, y+85);
  stroke(random(255), random(255), random(255));
  line(x, y+60, x-15, y+85);
  //arms
  stroke(random(255), random(255), random(255));
  line(x, y+40, x-30, y+30);
  stroke(random(255), random(255), random(255));
  line(x, y+40, x+30, y+30);
}
