
// Reese Wills
// Happy Creature/Sad Creature
// 8/5/2013


void setup() {
  size(1000, 800);
  smooth();
}

void draw() {
  background(0, 0, 30);

  if (mousePressed) {
    myHappyCreature();
  } else {
    mySadCreature();
  }
}

void mySadCreature() {

  fill(150, 150, 0);
  ellipse(mouseX, mouseY, 700, 700);

  fill(250);
  ellipse(mouseX-150, mouseY-125, 250, 250);
  fill(0);
  ellipse(mouseX-150, mouseY-125, 150, 150);
  fill(0, 0, 200);
  ellipse(mouseX-150, mouseY-125, 100, 100);
  fill(0);
  ellipse(mouseX-150, mouseY-125, 50, 50);
  fill(250);
  ellipse(mouseX+150, mouseY-125, 250, 250);
  fill(0);
  ellipse(mouseX+150, mouseY-125, 150, 150);
  fill(0, 0, 250);
  ellipse(mouseX+150, mouseY-125, 100, 100);
  fill(0);
  ellipse(mouseX+150, mouseY-125, 50, 50);

  fill(0, 0, 0);
  ellipse(mouseX-25, mouseY+50, 25, 25);

  ellipse(mouseX+25, mouseY+50, 25, 25);

  fill(0);
  ellipse(mouseX, mouseY+250, 300, 75);
  ellipse(mouseX+132, mouseY+275, 50, 75);
  ellipse(mouseX-132, mouseY+275, 50, 75);
  fill(0, 0, 150);
  triangle(mouseX+50, mouseY-50, mouseX+250, mouseY-50, mouseX+175, mouseY+100);
}

void myHappyCreature() {
  fill(150, 150, 0);
  ellipse(mouseX, mouseY, 700, 700);

  fill(250);
  ellipse(mouseX-150, mouseY-125, 250, 250);
  fill(0);
  ellipse(mouseX-150, mouseY-125, 150, 150);
  fill(0, 0, 200);
  ellipse(mouseX-150, mouseY-125, 100, 100);
  fill(0);
  ellipse(mouseX-150, mouseY-125, 50, 50);
  fill(250);
  ellipse(mouseX+150, mouseY-125, 250, 250);
  fill(0);
  ellipse(mouseX+150, mouseY-125, 150, 150);
  fill(0, 0, 250);
  ellipse(mouseX+150, mouseY-125, 100, 100);
  fill(0);
  ellipse(mouseX+150, mouseY-125, 50, 50);

  fill(0, 0, 0);
  ellipse(mouseX-25, mouseY+50, 25, 25);

  ellipse(mouseX+25, mouseY+50, 25, 25);

  fill(0);
  ellipse(mouseX, mouseY+250, 300, 75);
  ellipse(mouseX+132, mouseY+225, 50, 75);
  ellipse(mouseX-132, mouseY+225, 50, 75);
}
