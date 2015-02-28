
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
if (mousePressed) {
  mySadCreature();
}

else {
  myHappyCreature();
}
}
//============================================================

void mySadCreature(){
 background(0,56,250);
  rect(mouseX+100,mouseY+150, 100, 150);
ellipse(mouseX+150, mouseY+125, 90, 90);
fill(7,116,222);
line(mouseX+100, mouseY+225, mouseX+50, mouseY+150);
line(mouseX+200, mouseY+225, mouseX+250, mouseY+150);
fill(7,116,222);
}

//=========================================================

void myHappyCreature(){
  background(0,56,250);
rect(mouseX+100,mouseY+150, 100, 150);
ellipse(mouseX+150, mouseY+125, 90, 90);
fill(216,255,3);
line(mouseX+100, mouseY+225, mouseX+50, mouseY+150);
line(mouseX+200, mouseY+225, mouseX+250, mouseY+150);

}

//===========================================================
