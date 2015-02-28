
int monsterY = 50;
int monsterX = 50;
int teller = 0;


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
  ellipse(monsterX+15, monsterY-20, 30, 30);
  //linker pupil
  fill (0);
  ellipse (monsterX+12, monsterY-20, 10, 10);
  //rechter pupil
  fill (0);
  ellipse (monsterX-20, monsterY-20, 10, 10);
  //linker voet
  fill(255, 200, 255);
  ellipse(monsterX +20, monsterY+60, 35, 40);
  //rechtervoet
  fill(255, 200, 255);
  ellipse(monsterX-15, monsterY+60, 35, 40);
  //mond
  fill(0);
  ellipse(monsterX, monsterY+25, 40, 10);

  //bewegen monster
  if (monsterX >= 50 && monsterY == 50) {
    monsterX = monsterX +1;
  }
  else if (monsterX <= 450 && monsterY == 419) {
    monsterX =monsterX -1;
  }
  if (monsterX == 450 && monsterY >= 50) {
    monsterY = monsterY +1;
  }
  else if (monsterX ==50 && monsterY <= 419) {
    monsterY = monsterY -1;
  }

  //teller
  if (monsterX == 50 && monsterY == 50) {
    println(teller=teller+1);
  }
  if (monsterX == 450 && monsterY == 419) {
    println(teller=teller+1);
  }
  if (monsterX == 449 && monsterY == 50) {
    println(teller=teller+1);
  }
  if (monsterX ==51 && monsterY == 419) {
    println(teller=teller+1);
  }


  monsterX = constrain(monsterX, 50, 450);
  monsterY = constrain(monsterY, 50, 419);
}

