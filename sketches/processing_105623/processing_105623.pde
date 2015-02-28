
void setup() {
  size (500, 500);
}

void draw() {
  /*
  ellipse(mouseX - 20, mouseY - 20, 80, 80);
   //eyes
   line(mouseX +20,mouseY +20,mouseX + 40,mouseY + 60);
   line(mouseX + 40,mouseY +60,mouseX + 60,mouseY + 20);
   ellipse(mouseX + 60, mouseY +20, 15, 15);
   ellipse(mouseX + 20, mouseY +20, 15, 15);
   
   ellipse(mouseX + 40,mouseY + 60,35,35);
   */
  background(200, 255, 200);


  if (mousePressed) {
    myHappyCreature();
  } else {
    mySadCreature();
  }
}
//=======

void myHappyCreature() {
  //creature code here
  //background(255,255,255);
  fill(0);


  line(mouseX +20, mouseY +20, mouseX +40, mouseY +60);
  line(mouseX + 40, mouseY +60, mouseX +60, mouseY +20);
  ellipse(mouseX + 60, mouseY +20, 15, 15);
  ellipse(mouseX + 20, mouseY +20, 15, 15);
  ellipse(mouseX + 40, mouseY + 60, 50, 50);
}

//=======

void mySadCreature() {
  fill(225, 200, 250);
  line(mouseX +20, mouseY +20, mouseX +40, mouseY +60);
  line(mouseX + 40, mouseY +60, mouseX +60, mouseY +20);
  ellipse(mouseX + 60, mouseY +20, 15, 15);
  ellipse(mouseX + 20, mouseY +20, 15, 15);
  ellipse(mouseX + 40, mouseY + 60, 50, 50);
}
