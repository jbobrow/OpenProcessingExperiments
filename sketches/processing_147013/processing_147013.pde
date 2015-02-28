
void setup() {

  size(700,600);
  background(255);
  smooth();
}

float mouseX2, mouseY2;
float vX, vY;

void draw(){
  if(mousePressed == true) {
  mouseX2= mouseX2+ (mouseX-mouseX2)/10;
  mouseY2= mouseY2+ (mouseY-mouseY2)/10;

 vX=mouseX2;
 vY=mouseY2;
  stroke(255,100);
  fill(255,0,random(255),150);
  ellipse(vX,vY,20,20);
}
}
