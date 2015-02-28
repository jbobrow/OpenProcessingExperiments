
int diameter=100;

void setup(){
  size(400,400);
}

void draw(){
  background(250,50,150);
  diameter=diameter+2;
  fill(diameter,mouseY,diameter);
  ellipse(mouseX,200,diameter,diameter);
}


