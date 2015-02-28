
void setup(){
  size(200,300);
}

void draw(){
  ellipse(mouseX,mouseY,10,10);
  int x = (100 - mouseX) +100;
  ellipse(x,mouseY,10,10);
}

