
int MO;

color c1 = color(155,0,165);
color c2 = color(0,200,0);
color c3 = color(130,200);

void setup(){
  MO=200;
  size(900,450);
  background(155);
}
void draw(){
  MO= MO - 1;
 fill(c1);
  triangle(mouseX,mouseY,mouseX+MO,mouseY+0,mouseX+0,mouseY+MO);
  triangle(mouseX,mouseY,mouseX-MO,mouseY+0,mouseX+0,mouseY-MO);
  fill(c2);
  triangle(mouseX,mouseY,mouseX+0,mouseY-MO,mouseX+MO,mouseY+0);
  triangle(mouseX,mouseY,mouseX+0,mouseY+MO,mouseX-MO,mouseY+0);
  fill(c3);
  ellipse(mouseX,mouseY,-MO,MO);
  }
void mouseClicked () {
MO=100;
}             
