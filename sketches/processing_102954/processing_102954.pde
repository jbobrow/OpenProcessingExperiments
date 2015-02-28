
void setup(){
  size(300,300);
   background(204);
}

void draw (){
   
  colorMode(HSB,100);
  stroke(mouseX);
  fill(mouseX,mouseY,100,255);
  rect(mouseX,mouseY,mouseX,mouseY,mouseX,mouseY,mouseX,mouseY);
}
