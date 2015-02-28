
int monsterY;

void setup() {
  size(200, 200);
  monsterY = 200;
}

void draw() {
  background(255);
  stroke(0, 255, 0);
  fill(250, 100, 150);
  rect(mouseX, monsterY, 100, 100);
  rectMode(CENTER);
  fill(0, 255, 0);
  ellipse(mouseX-2, monsterY-20, 40, 40);
  rect(mouseX-32, monsterY+70, 25, 40);
  rect(mouseX+33, monsterY+70, 25, 40);
  rect(mouseX-40, monsterY+80, 20, 20);
  rect(mouseX+40, monsterY+80, 20, 20);
  fill(255);
  ellipse(mouseX-2, monsterY-20, 20, 20);
  fill(0);
  stroke(0);
  ellipse(mouseX, monsterY-20, 6, 6);
  fill(255, 0, 0);
  stroke(255, 0, 0);
  ellipse(mouseX, monsterY+30, 60, 20);
  fill(255);
  rect(mouseX, monsterY+25, 10, 10);
  fill(0, 255, 0);
  stroke(0, 255, 0);
  rect(mouseX-60, monsterY+20, 20, 20);
  rect(mouseX-60, monsterY+6, 7, 7);
  rect(mouseX+60, monsterY+20, 20, 20);
  rect(mouseX+60, monsterY+6, 7, 7);
  rect(mouseX, monsterY-63, 1, 25);
  ellipse(mouseX, monsterY-80, 10, 10);
  
  monsterY = monsterY - 1;
}

