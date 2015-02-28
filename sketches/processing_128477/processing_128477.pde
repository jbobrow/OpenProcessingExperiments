

int monsterpositionX;
int monsterpositionY;
 
int richting;
int teller;
 
boolean test;
 
int y;
int spatie;
int stop;
int breedte;
int hoogte;
 
float i = 50;
 
void setup() {
  size(500, 500);
  background(100);
  monsterpositionX = 250;
  monsterpositionY = 400;
  richting = 15;
  teller = 0;
  test = true;
  y = 0;
  spatie = 30;
  stop = height;
  breedte = 50;
  hoogte = 50;
  frameRate(60);
}
void draw() {
 
  background(255);
  monstercolour();
  drawmonster();
  partyballs();
  monstermovement();
  strokeWeight(3);
  stroke(96, 0, 0);
  fill(0, 30, 20);
}
 
void monstercolour() {
 
  if (test == true) {
    fill(255);
  }
  else if (test == false) {
    fill(255, 0, 0);
  }
 
  strokeWeight(2);
  if (test == true) {
    fill(0);
  }
  else if (test == false) {
    fill(100, 30, 20);
  }
 
  if (test == true) {
    fill(0);
  }
  else if (test == false) {
    fill(80, 0, 0);
  }
 
 
  fill(10);
  stroke(0);
 
 
  stroke(96, 0, 0);
  if (test == true) {
    fill(255);
  }
  else if (test == false) {
    fill(0, 0, 255);
  }
 
  println(teller);
 
  if (teller == 10) {
    teller = 0;
    test = !test;
  }
}
 
void monstermovement() {
 
  monsterpositionX = mouseX;
  monsterpositionY = monsterpositionY - richting;
 
  if (monsterpositionY < 0 + 100) {
    richting = -richting;
    teller = teller +1;
  }
  if (monsterpositionY > 500 - 100) {
    richting = -richting;
  }
}
 
void partyballs() {
 
  strokeWeight(1);
  for (int i=0; i < 100; i ++) {
    stroke(random(255), random(255), random(255));
    ellipse(random(0, 500), random(0, 500), 10, 20);

  }
 
  while (i > 500) {
    i = 0;
  }
}
 
void drawmonster() {
 
  strokeWeight(3);
 
stroke(96, 0, 0);
ellipse(monsterpositionX +100,monsterpositionY +100,100,100);//hoofd
ellipse(monsterpositionX +75,monsterpositionY +100,25,25); //  linker oog
ellipse(monsterpositionX +125,monsterpositionY +100,25,25);//  rechter oog
line(monsterpositionX +125,monsterpositionY +125,monsterpositionX +75,monsterpositionY +125);//    mond
line(monsterpositionX +100,monsterpositionY +150,monsterpositionX +100,monsterpositionY +300);//   lijf
line(monsterpositionX +100,monsterpositionY +200,monsterpositionX +50,monsterpositionY +150);//    linker arm
line(monsterpositionX +100,monsterpositionY +200,monsterpositionX +150,monsterpositionY +150);//   rechter arm
line(monsterpositionX +100,monsterpositionY +300,monsterpositionX +60,monsterpositionY +350);//    linker been
line(monsterpositionX +100,monsterpositionY +300,monsterpositionX +140,monsterpositionY +350);//   rechter been
  
monsterpositionX = monsterpositionX;
  
  
}

