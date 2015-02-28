
float r=0;
void setup() {
  size(500,500,P3D);
noFill();
strokeWeight(5);
stroke(255,0,0);
  
}

void draw(){
  background(100);
  stroke(255,0,0);
  translate(mouseX,mouseY, 200);
  rotateX(r);
  rotateY(r);
  rotateZ(r);
  box(50);
  stroke(0,0,255);
 rotateX(r*0.2);
  rotateY(r*0.2);
  rotateZ(r*0.2);
  box(60);
   stroke(0,255,0);
 rotateX(r*0.25);
  rotateY(r*0.25);
  rotateZ(r*0.25);
  box(70);
  r=r+0.05;
}

