
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
 fill(0, 0, 0);
  rectMode(CENTER);
  rect( monsterX, monsterY+25, 50, 100);                    //lichaam
  line(monsterX-50, monsterY, monsterX, monsterY+50 );      //arm links
  line(monsterX, monsterY+50, monsterX+50, monsterY );       //arm rechts
  fill(0,0,255);                
  ellipse(monsterX, monsterY-30, 60, 60);                    //hoofd
  fill(0);                   
  ellipse(monsterX-19, monsterY-30, 16, 32);                 //oogkast links
  ellipse(monsterX+19, monsterY-30, 16, 32);                //oogkast rechts
  fill(0,255,0);
  ellipse(monsterX-17, monsterY-30, 14, 30);              //oogbal links
fill(255,0,0);  
  ellipse(monsterX+18, monsterY-30, 14, 30);                //oogbal rechts
  line(monsterX+20, monsterY+90, monsterX+20, monsterY+75);  //been rechts
  line( monsterX-20, monsterY+90, monsterX-20, monsterY+75);  //been links
  line( monsterX+20, monsterY+90, monsterX+30, monsterY+90);   //voet rechts
  line( monsterX-20, monsterY+90, monsterX-30, monsterY+90);   //voet links
}
}
