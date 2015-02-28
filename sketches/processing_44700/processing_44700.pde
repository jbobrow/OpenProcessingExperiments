
int a=160;
int b=60;

void setup(){
size(640,480);
background(255,0,0);
smooth();
};
void draw(){
  background(0,255,0);
  fill(255,0,0,125);
  ellipse(mouseX,mouseY,b,b*2);
  fill(0,0,255,150);
  rect (mouseX*1.5,mouseY,b,a);
  strokeWeight(2);
  line(mouseX,mouseY,mouseX*2,mouseY*2);
}

