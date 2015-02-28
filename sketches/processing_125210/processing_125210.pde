
  int monsterY = 390;
  int monsterX = 220;
  

void setup() {
  size(500, 500);
}
void draw() {
  background(255);
  //hoofd
  fill(255, 200, 255);
  ellipse(monsterX, monsterY, 100, 100);
//linker iris
  fill(255, 255, 255);
  ellipse(monsterX-20, monsterY-20, 30, 30);
  //rechter iris
  fill(255, 255, 255);
  ellipse(monsterX+15,monsterY-20, 30, 30);
  //linker pupil
  fill (0);
  ellipse (monsterX+12, monsterY-20,10,10);
  //rechter pupil
  fill (0);
  ellipse (monsterX-20, monsterY-20,10,10);
  fill(255, 200, 255);
  ellipse(monsterX +20, monsterY+60, 35, 40);
  fill(255, 200, 255);
  ellipse(monsterX-15, monsterY+60, 35, 40);
  fill(0);
  ellipse(monsterX, monsterY+25, 40, 10);


if (monsterY > 60)
 monsterY = monsterY - 1;
  
if (monsterY < 61)
monsterY = monsterY +390;
 }
