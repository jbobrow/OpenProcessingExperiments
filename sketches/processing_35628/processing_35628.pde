
//Iv Shqevi
void setup(){
  size(300,300);
  colorMode(RGB,150);
}

void draw(){
  background(100,mouseY,255);
  fill(mouseX,0,255);
  //starting on the left
  ellipse(mouseX,150,50-mouseX,50-mouseY);
  //starting on the right
  ellipse(300-mouseX,150,50-mouseX,50-mouseY);
  line(150,0,150,300-mouseY);
}

