
int a=120;
int b=50;

void setup(){
size(640,480);
background(255,0,0);
};
void draw(){
  background(255,0,0);
  fill(220);
  ellipse(mouseX,mouseY,b,b);
  rect (mouseX*1.5,mouseY,b,a);
}

