
int x= 500;
int y= 400;
int radio= 70;

void setup(){
  size(1000, 800);
  ellipseMode(RADIUS);
}

void draw(){
  background(200);
  float d= dist(mouseX, mouseY, x, y);
  if (d< radio){
    fill(0);
  }else{
    fill(255);
  }ellipse (x, y, radio, radio);
}
