
void setup() {
  size(300,300);
}

void draw() {

background(0);
myCreature();
}
//=======================


void myCreature(){
   int originX = mouseX-150;
  int originY = mouseY-150;
if (mousePressed) {
// Face
fill(100,200,0);
strokeWeight(6);
ellipse(originX+150,originY+150,200,200);
// Eyes
fill(255,255,255);
ellipse(originX+105,originY+100,50,30);
fill(255,255,255);
ellipse(originX+200,originY+100,50,30);
fill(0,0,0);
ellipse(originX+105,originY+100,25,30);
fill(0,0,0);
ellipse(originX+200,originY+100,25,30);
// Mouth
fill(0,0,0);
ellipse(originX+150,originY+175,100,50);
}
else {
  fill(0,100,200);
strokeWeight(6);
ellipse(originX+150,originY+150,200,200);
// Eyes
fill(255,255,255);
ellipse(originX+105,originY+100,50,30);
fill(255,255,255);
ellipse(originX+200,originY+100,50,30);
fill(0,0,0);
ellipse(originX+105,originY+100,25,30);
fill(0,0,0);
ellipse(originX+200,originY+100,25,30);
// Mouth
line(originX+105,originY+200,originX+200,originY+200);


}
}
