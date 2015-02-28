
int monsterX;
int monsterY;

void setup () {
  monsterX=212;
  monsterY=212;
  size(500, 500);
}

void draw () { 
  background(150,255);
  fill(#E8781C);
  rect(monsterX-75, monsterY-145, 200, 250);
  fill(#76A2C6);
  rect(monsterX-50, monsterY-120, 50, 80);
  rect(monsterX+50, monsterY-120, 50, 80);
  fill(0);
  rect(monsterX-15, monsterY-90, 15, 50);
  rect(monsterX+50, monsterY-90, 15, 50);
  fill(#E84F1C);
  rect(monsterX+12, monsterY-30, 25, 50);
  rect(monsterX, monsterY, 12, 20);      // 100, 170
  rect(monsterX+37, monsterY, 12, 20);
  fill(#9D918D);
  rect(monsterX-50, monsterY+40, 150, 40);
  fill(#E8781C);
  rect(monsterX+15, monsterY+105, 30, 80);
  rect(monsterX-5, monsterY+200, 20, 60);
  rect(monsterX+45, monsterY+200, 20, 60);
  rect(monsterX-5, monsterY+180, 70, 20);
  rect(monsterX-45, monsterY+130, 150, 20);
}

