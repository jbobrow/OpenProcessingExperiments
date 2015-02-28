

int monsterY=200;
int r=1;
void setup () {


  size (500, 500);
}

void draw() {
  background(255);
  monsterY--;

  stroke(0);
  fill(255);

  line(mouseX, monsterY+25, mouseX, monsterY+150);
  //benen lr
  line(mouseX, monsterY+150, mouseX-50, monsterY+250);
  line(mouseX, monsterY+150, mouseX+50, monsterY+250);
  //armen lr
  line(mouseX, monsterY+75, mouseX+60, monsterY+150);
  line(mouseX, monsterY+75, mouseX-60, monsterY-25);
  //hoofd
  ellipse(mouseX, monsterY, 50, 50);
  //oogleden lr
  fill(0);
  //ogen lr
  fill(255);
  ellipse(mouseX-10, monsterY+8, 10, 5);
  ellipse(mouseX+10, monsterY+8, 10, 5);
  fill(255, 0, 0);
  triangle(mouseX-25, monsterY, mouseX+25, monsterY, mouseX, monsterY-75);
}

