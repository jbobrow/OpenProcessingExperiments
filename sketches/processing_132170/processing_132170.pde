
Monster mijnMonster;
Monster mijnMonster2;
Monster mijnMonster3;
 
void setup() {
  size(500, 500);
  mijnMonster = new Monster(90, 80, 10);
  mijnMonster2 = new Monster(220, 25, 5);
  mijnMonster3 = new Monster(350, 250, 5);
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
 
class Monster { //Class van het monstertje
  int monsterX;
  int monsterY;
  int richting;
  int teller;
  boolean test; //Zorgt voor kleur
 
  Monster (int tempX, int tempY, int tempRichting) {
    monsterX = tempX;
    monsterY = tempY; 
    richting = tempRichting; //Snelheid
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


  
void drawMonster(){
  fill(150,0,50);
  ellipse(monsterX, monsterY-50, 80, 60);
  fill(50);
  ellipse(monsterX-29, monsterY-50, 16, 32);   
  ellipse(monsterX+29, monsterY-50, 16, 32);
  ellipse(monsterX, monsterY-30, 10, 10);
  fill(150,0,50); //Kleur lichaam RGB
  ellipse(monsterX, monsterY, 40, 40); //lichaam //X=100 Y=130
  line(monsterX-30, monsterY+10, monsterX-20, monsterY);   //armen links
  line(monsterX+20, monsterY, monsterX+30, monsterY+10); //armen rechts
  line(monsterX-10, monsterY+15, monsterX-20, monsterY+40);   //benen links
  line(monsterX+10, monsterY+15, monsterX+20, monsterY+40); //benen rechts
  line(monsterX-30, monsterY-70, monsterX-70, monsterY-110); //spriet links
  line(monsterX+30, monsterY-70, monsterX+70, monsterY-110);  //spriet rechts
}

void drawBeweging(){
//bewegen monster naar rechts
if(monsterX >=80 && monsterY ==150){
  monsterX = monsterX +10;
  teller=teller+1;
}
//bewegen monster naar links
if(monsterX <= 420 && monsterY == 350){
  monsterX = monsterX -10;
}
//bewegen monster omlaag
if (monsterX == 350 && monsterY >=80){
  monsterY = monsterY +10;
}

//bewegen monster omhoog
if (monsterX == 80 && monsterY <=350){
  monsterY = monsterY -10;
}



}}

