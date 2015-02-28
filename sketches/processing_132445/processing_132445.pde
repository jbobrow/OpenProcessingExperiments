
spaceinvader spaceinvader1;
spaceinvader spaceinvader2;
spaceinvader spaceinvader3;
 
int y;
int spatie;
int stop;
int breedte;
int hoogte;
 
float i = 50;
 
void setup() {
  size(500, 500);
  background(100);
  y = 0;
  spatie = 30;
  stop = height;
  breedte = 10;
  hoogte = 10;
  frameRate(50);
 
  spaceinvader1 = new spaceinvader();
  spaceinvader2 = new spaceinvader();
  spaceinvader3 = new spaceinvader();
}
void draw() {
 
  background(255);
  partyrain();
 
  spaceinvader1.monstercolour();
  spaceinvader1.drawmonster();
  spaceinvader1.monstermovement();
 
  spaceinvader2.monstercolour();
  spaceinvader2.drawmonster();
  spaceinvader2.monstermovement();
 
  spaceinvader3.monstercolour();
  spaceinvader3.drawmonster();
  spaceinvader3.monstermovement();
 
  strokeWeight(3);
  stroke(96, 0, 0);
  fill(172,220,95);
}
 
 
 
void partyrain() {
 
  strokeWeight(1);
  for (int i=0; i < 100; i ++) {
    stroke(random(255), random(255), random(255));
    ellipse(random(0, 500), random(0, 500), 1, 75);
  }
 
  while (i > 500) {
    i = 0;
  }
}
 
 
 
class spaceinvader {
 
  float PosX;
   
  float monsterposX;
  float monsterposY;
 
  int richting;
  int teller;
 
  boolean test;
 
  spaceinvader() {
     
    PosX = random(-200,200);
     
    monsterposX = random(100, 400);
    monsterposY = random(100, 400);
    richting = 5;
    teller = 0;
    test = true;
  }
 
  void monstercolour() {
 
    if (test == true) {
      fill(0);
    }
    else if (test == false) {
      fill(55, 0, 0);
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
      fill(0);
    }
    else if (test == false) {
      fill(60, 0, 0);
    }
 
    println(teller);
 
    if (teller == 10) {
      teller = 0;
      test = !test;
    }
  }
 
  void monstermovement() {
 
    monsterposX = mouseX + PosX;
    monsterposY = monsterposY - richting;
 
    if (monsterposY < 0 + 100) {
      richting = -richting;
      teller = teller +1;
    }
    if (monsterposY > 500 - 100) {
      richting = -richting;
    }
  }
  void drawmonster() {
 
    fill(172,220,95);
rect(mouseX-50,monsterposY-10,10,10);
rect(mouseX-50,monsterposY,10,10);
rect(mouseX-50,monsterposY+10,10,10);
rect(mouseX-50,monsterposY+20,10,10);
rect(mouseX-40,monsterposY+10,10,10);
rect(mouseX-40,monsterposY+20,10,10);
rect(mouseX-40,monsterposY+30,10,10);
rect(mouseX-40,monsterposY+50,10,10);
rect(mouseX-30,monsterposY-20,10,10);
rect(mouseX-30,monsterposY,10,10);
rect(mouseX-30,monsterposY+10,10,10);
rect(mouseX-30,monsterposY+20,10,10);
rect(mouseX-30,monsterposY+30,10,10);
rect(mouseX-30,monsterposY+40,10,10);
rect(mouseX-20,monsterposY-10,10,10);
rect(mouseX-20,monsterposY,10,10);
rect(mouseX-20,monsterposY+20,10,10);
rect(mouseX-20,monsterposY+30,10,10);
rect(mouseX-10,monsterposY,10,10);
rect(mouseX-10,monsterposY+10,10,10);
rect(mouseX-10,monsterposY+20,10,10);
rect(mouseX-10,monsterposY+30,10,10);
rect(mouseX,monsterposY,10,10);
rect(mouseX,monsterposY+10,10,10);
rect(mouseX,monsterposY+20,10,10);
rect(mouseX,monsterposY+30,10,10);
rect(mouseX+10,monsterposY,10,10);
rect(mouseX+10,monsterposY+10,10,10);
rect(mouseX+10,monsterposY+20,10,10);
rect(mouseX+10,monsterposY+30,10,10);
rect(mouseX+20,monsterposY-10,10,10);
rect(mouseX+20,monsterposY,10,10);
rect(mouseX+20,monsterposY+20,10,10);
rect(mouseX+20,monsterposY+30,10,10);
rect(mouseX+30,monsterposY-20,10,10);
rect(mouseX+30,monsterposY,10,10);
rect(mouseX+30,monsterposY+10,10,10);
rect(mouseX+30,monsterposY+20,10,10);
rect(mouseX+30,monsterposY+30,10,10);
rect(mouseX+30,monsterposY+40,10,10);
rect(mouseX+40,monsterposY+10,10,10);
rect(mouseX+40,monsterposY+20,10,10);
rect(mouseX+40,monsterposY+30,10,10);
rect(mouseX+40,monsterposY+50,10,10);
rect(mouseX+50,monsterposY-10,10,10);
rect(mouseX+50,monsterposY,10,10);
rect(mouseX+50,monsterposY+10,10,10);
rect(mouseX+50,monsterposY+20,10,10);
  }
}

