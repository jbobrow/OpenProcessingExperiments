
void setup(){
  size(300,300);
}

void draw (){
    background(204);
  colorMode(HSB,100);
  fill(mouseX,mouseY,100,255);
  rect(mouseX,mouseY,mouseX,mouseY,mouseX,mouseY,mouseX,mouseY);
}
