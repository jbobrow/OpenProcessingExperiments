
  int MO;

color c1 = color(102,164,0);
color c2 = color(641,254,10);
color c3 = color(10,155);

void setup(){
  MO=20;
  size(500,200);
  background(215,365,105,100);
}
void draw(){
  MO= MO + 1;
 fill(c1);
  triangle(mouseX,mouseY,mouseX+MO,mouseY+0,mouseX+0,mouseY+MO);
  triangle(mouseX,mouseY,mouseX-MO,mouseY+0,mouseX+0,mouseY-MO);
  fill(c2);
  triangle(mouseX,mouseY,mouseX+0,mouseY-MO,mouseX+MO,mouseY+0);
  triangle(mouseX,mouseY,mouseX+0,mouseY+MO,mouseX-MO,mouseY+0);
  fill(c3);
  ellipse(mouseX,mouseY,MO,MO);
  }
void mouseClicked () {
MO=10;
}             
