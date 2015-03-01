
void setup(){
  size(1000, 1000);
}

void draw(){
  if(mousePressed) {
    fill(255,0,170);
    triangle(mouseX,mouseY,mouseX,mouseY,width/2,height/2);
    triangle(0,0,mouseX,mouseY, 50,50);
  } else {
    fill(30);
  }
  if(mouseX>width || mouseY<height);
  float mouseY= random(width);
  ellipse(mouseX,mouseY, 50, 50);
}
