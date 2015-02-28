
Monster mijnMonster;
Monster mijnMonster2;
Monster mijnMonster3;
 
void setup() {
  size(1000, 1000);
  mijnMonster = new Monster(203, 23, 15);
  mijnMonster2 = new Monster(800, 82, 8);
  mijnMonster3 = new Monster(500, 245, 2);
}
 
void draw() {
  background(255);
  mijnMonster.update();
  mijnMonster.testRand();
  mijnMonster.drawMonster();
 
  mijnMonster2.update();
  mijnMonster2.testRand();
  mijnMonster2.drawMonster();
 
  mijnMonster3.update();
  mijnMonster3.testRand();
  mijnMonster3.drawMonster();
}
 
class Monster { 
  int monsterX;
  int monsterY;
  int richting;
  int teller; 
  boolean test; 
 
  Monster (int tempX, int tempY, int tempRichting) {
    monsterX = tempX; 
    monsterY = tempY; 
    richting = tempRichting; 
    test = true;
  }
 
  void update() {
    monsterY = monsterY + richting;
  }
 
  void testRand() {
    if (monsterY < 0 || monsterY > height) {
      richting=-richting;
 
      if (teller == 10) {
        teller = 0;
        test = !test;
      }
      teller = teller + 1;
    }
  }
 
  void drawMonster() {
  //hoofd
fill (205,0,205);
ellipse(monsterX,monsterY,260,350);
 
//rechteroog
fill (255,0,0);
ellipse(monsterX+50,monsterY-25,100,100);
//linkeroog
ellipse(monsterX-45,monsterY-25,100,100);
 
//rechter pupil
fill(0,0,0);
ellipse(monsterX+50,monsterY-25,40,40);
//linker pupil
ellipse(monsterX-45,monsterY-25,40,40);
//unibrown
rect(monsterX-100,monsterY-75,200,20);
//linker neusgat
ellipse(monsterX-20,monsterY+55,20,20);
//rechter neusgat
ellipse(monsterX+20,monsterY+55,20,20);
//mond
fill(176,23,31);
ellipse(monsterX,monsterY+125,170,50);
fill (0,0,0);
line(monsterX-85,monsterY+125,monsterX+85,monsterY+125);
   
  }
}

