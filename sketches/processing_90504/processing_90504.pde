
void setup(){
  size(480,480);
  smooth();
}

void draw(){
  //background(255);
  if (mousePressed){ //chang the color when i click the mouse
    ellipse(mouseX,mouseY,30,30);
    fill(random(0,255),random(0,255),random(0,255),120);
  }
}
