
int monsterY;
int monsterX;

void setup() {
  size(800, 500);
}

void draw() {
  background(255, 255, 255);
  
  duplicate();
  //createMonster(700, 100);
  //createMonster(500, 100);
  //createMonster(300, 100);
  //createMonster(100, 100);
}

void duplicate() {
  for(int i = 0; i < 5; i++) {
    createMonster(i*200,200);
  }
}


void createMonster(int posx, int posy) {
  //Het hoofd
  noStroke();
  fill(255, 218, 0);
  ellipseMode(CENTER);
  ellipse(posx-monsterX-0, posy-monsterY, 200, 200);

  //mond
  fill(0, 0, 0);
  ellipseMode(CENTER);
  ellipse(posx-monsterX-0, posy-monsterY+25, 140, 90);

  //monde
  fill(255, 218, 0);
  ellipseMode(CENTER);
  ellipse(posx-monsterX-0, posy-monsterY+5, 150, 55);

  //rechter oog
  fill(0, 0, 0);
  ellipseMode(CENTER);
  ellipse(posx-monsterX+30, posy-monsterY-20, 40, 60);

  fill(255, 218, 0);
  noStroke();
  //                1ste punt           2e punt            3e punt
  triangle(posx-monsterX+25, posy-monsterY-10, posx-monsterX+55, posy-monsterY-5, posx-monsterX+55, posy-monsterY-20);

  //linker oog
  fill(0, 0, 0);
  ellipseMode(CENTER);
  ellipse(posx-monsterX-30, posy-monsterY-20, 40, 60);

  fill(255, 218, 0);
  noStroke();
  //                1ste punt           2e punt            3e punt
  triangle(posx-monsterX-25, posy-monsterY-10, posx-monsterX-50, posy-monsterY-5, posx-monsterX-50, posy-monsterY-20);
}

