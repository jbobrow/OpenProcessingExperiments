
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
  /*body*/
fill(100,0,200);
noStroke();
ellipseMode(CENTER);
ellipse(monsterX, monsterY +80,/*100,120,*/80,118);


/*head*/
stroke(0,0,0,180);
ellipseMode(CENTER);
ellipse(monsterX, monsterY,  75,75);


/*eyeballs*/
fill(0, 230);
stroke(0);
ellipseMode(CENTER);
ellipse(monsterX+13, monsterY -13,33,33);
fill(0, 230);
stroke(0);
ellipseMode(CENTER);
ellipse(monsterX -13, monsterY -13,33,33);

/*eye1*/
fill(255);
noStroke();
stroke(255,100);
ellipseMode(CENTER);
ellipse(monsterX -14, monsterY -11,17,17);

/*eye2*/
fill(255);
stroke(255,100);
ellipseMode(CENTER);
ellipse(monsterX +13, monsterY -11, 17,17);

fill(0);
stroke(255,100);
ellipseMode(CENTER);
ellipse(monsterX +12, monsterY +2 -11,11,11);

fill(0);
stroke(255,100);
ellipseMode(CENTER);
ellipse(monsterX -11, monsterY +2 -11, 11,11);

/*voet1*/
fill(0);
stroke(0,0,0,180);
ellipseMode(CENTER);
ellipse(monsterX -30, monsterY +135,40,25);

/*voet2*/
fill(0);
stroke(0,0,0,180);
ellipseMode(CENTER);
ellipse(monsterX +30, monsterY +135,40,25);

/*hand1*/

stroke(0,0,0,180);
ellipseMode(CENTER);
ellipse(monsterX +52, monsterY +42,30,20);

/*hand2*/

stroke(0,0,0,180);
ellipseMode(CENTER);
ellipse(monsterX -52, monsterY +42,30,20);

}
}


