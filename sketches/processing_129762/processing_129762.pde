
Monster mijnMonster;
Monster mijnMonster2;
Monster mijnMonster3;
 
void setup() {
  size(500, 500);
  mijnMonster = new Monster(200,30,5); //monster aanmaken met de positie 200,30 en de snelheid 5
  mijnMonster2 = new Monster(70,80,10);
  mijnMonster3 = new Monster(400,200,20);
  }
 
void draw() {
  background(255);
  mijnMonster.update();
  mijnMonster.testRand();
  mijnMonster.drawMonster(); //een laag dieper (in de class) het monster tekenen
   
  mijnMonster2.update();
  mijnMonster2.testRand();
  mijnMonster2.drawMonster();
   
  mijnMonster3.update();
  mijnMonster3.testRand();
  mijnMonster3.drawMonster();
}
 
class Monster{// class van het monster
int monsterX; //positie op de x-as
int monsterY; //positie op de y-as
int richting; // de snelheid en richting van het monster
int teller; //teller om van kleur te veranderen
boolean test; //kleur
 
  Monster(int tempX, int tempY, int tempRichting){
  monsterX = tempX;
  monsterY = tempY; //de positie van het monster bepalen door wat ingevuld wordt bij de setup
  richting = tempRichting;
  test = true;
  }

void update(){
 monsterY = monsterY + richting;
}
 
void testRand(){
    if(monsterY <= 0 || monsterY >= height){  //voorwaarde heen en weer bewegen
    richting = -richting; //omdraaien van richting
    teller = teller + 1; //de teller
  }
}

 void drawMonster(){ // het monster tekenen
 if(test){fill(0, 0, 255);}
  if(!test){fill(0,0, 0);}
  if(teller == 10){ teller = 0; test = !test;}
  //fill(0, 180, 0);
 ellipse(monsterX-10, monsterY+50, 40, 30);
  ellipse(monsterX+20, monsterY+50, 40, 30);
  ellipseMode(CENTER);
  //lijf en kop
  ellipse(monsterX, monsterY, 60, 60);
  ellipse(monsterX, monsterY-40, 70, 70);
  // oog staafjes
  line(monsterX-10, monsterY-100, monsterX-15, monsterY-70);
  line(monsterX+40, monsterY-100, monsterX+20, monsterY-70);
  fill(255);
  //oog wit rondje
  ellipse(monsterX-14, monsterY-100, 18, 18);
  ellipse(monsterX+36, monsterY-100, 18, 18);
  fill(0);
  //oog pupil
  ellipse(monsterX-12, monsterY-100, 12, 12);
  ellipse(monsterX+33, monsterY-100, 10, 10);
  fill(0);
  //mond
  ellipse(monsterX, monsterY-30, 50, 30);
  fill(255);
  //tanden
  ellipse(monsterX-10, monsterY-40, 12, 10);
  ellipse(monsterX, monsterY-40, 12, 10);
  ellipse(monsterX+10, monsterY-40, 12, 10);
  ellipse(monsterX-10, monsterY-20, 12, 10);
  ellipse(monsterX, monsterY-20, 12, 10);
  ellipse(monsterX+8, monsterY-20, 12, 10);
}



}

