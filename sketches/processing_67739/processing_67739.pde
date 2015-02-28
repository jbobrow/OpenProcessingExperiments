
float eyeR;
float eyeG;
float eyeB;
float moveX = 0;
float moveY = 0;

void setup () {

  size(1000, 1000);
  smooth();
}


void draw() {

  background(255);

  fill(41, 131, 57);
  stroke(41, 131, 57);
  smooth();
  rect(moveX+400, moveY+263, 100, 25);
  rect(moveX, moveY+263, 100, 25);
  ellipse(moveX+375, moveY+275, 100, 100);
  ellipse(moveX+125, moveY+275, 100, 100);
  rect(moveX+150, moveY+200, 25, 300);
  rect(moveX+325, moveY+200, 25, 300);
  ellipse(moveX+500, moveY+275, 25, 25);
  ellipse(moveX, moveY+275, 25, 25);
  rect(moveX+487, moveY+190, 25, 90);
  ellipse(moveX+500, moveY+200, 40, 40);

  fill(41, 131, 57);
  ellipse(moveX+250, moveY+270, 300, 350);

  fill(240, 238, 235);
  ellipse(moveX+250, moveY+250, 250, 250);

  eyeR=random(255);
  eyeG=random(255);
  eyeB=random(255);
  fill(eyeR, eyeG, eyeB);
  stroke(eyeR, eyeG, eyeB);
  ellipse(moveX+250, moveY+250, 50, 200);

  moveX = moveX + 1;
}


