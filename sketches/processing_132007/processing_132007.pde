
Monster mijnMonster;
Monster mijnMonster2;
Monster mijnMonster3;

void setup() {
  size(500,500);
  mijnMonster = new Monster(200,50,1);
  mijnMonster2 = new Monster(60,80,2);
  mijnMonster3 = new Monster(400,20,3);
}

void draw() {
  background(255);
  mijnMonster.update();
  mijnMonster.drawMonster();
  mijnMonster.test();
  
  mijnMonster2.update();
  mijnMonster2.drawMonster();
  mijnMonster2.test();
  
  mijnMonster3.update();
  mijnMonster3.drawMonster();
  mijnMonster.test();
}


class Monster{
int Y = 120;
int X = 100;
int y = 0;
int x = 0;
int stop = 900;
int spatie = 15;
int monsterX;
int monsterY;
int richting;
int teller;
boolean test;

  Monster(int tempX, int tempY, int tempRichting){
    monsterX = tempX;
    monsterY = tempY;
    richting = tempRichting;
    test = true;
  }
  void update(){
    monsterY = monsterY + richting;
    if(monsterY > width){
      richting = - richting;}
  }
  
  void test() {
    if(monsterY <=0 || monsterY >= height){
      richting = -richting;
      teller = teller + 1;
    }
  }

void drawMonster(){
  fill(31,222,40);
ellipse(monsterX, monsterY-30, 100, 70); //lichaam
  
fill(252);
  ellipse(monsterX-20, monsterY-65, 40, 40);
  ellipse(monsterX+20, monsterY-65, 40, 40);//ogen
  
fill (5, 0, 5);
  stroke(7, 0, 6);
  ellipse (monsterX-10, monsterY-60, 10, 10);
  ellipse (monsterX+10, monsterY-60, 10, 10);//pupillen
 
fill(224,103,225);
  ellipse (monsterX-35, monsterY-30, 12, 12);
  ellipse (monsterX+35, monsterY-30, 12, 12);//wangen
  fill (0);
  stroke(0);
  ellipse( monsterX, monsterY-15, 40, 20);//mond
  
}
}

