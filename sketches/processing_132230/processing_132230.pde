
Monster mijnMonster;
Monster mijnMonster2;
Monster mijnMonster3;
 
void setup() {
  size(500, 500);
  mijnMonster = new Monster(200,80,5); //monster aanmaken met de positie 200,30 en de snelheid 5
  mijnMonster2 = new Monster(70,280,10);
  mijnMonster3 = new Monster(400,380,20);
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
 monsterX = monsterX + richting;
}
 
void testRand(){
    if(monsterX <= 0 || monsterX >= width){  //voorwaarde heen en weer bewegen
    richting = -richting; //omdraaien van richting
    teller = teller + 1; //de teller
  }
}
 
void drawMonster(){ // het monster tekenen
 rectMode(CENTER);                              //Vierkant in het midden
  fill(0, 0, 0);                                   //Kleur lichaam 
  rect(monsterX, monsterY, 20, 100);              //Lichaam
  rect(monsterX -30, monsterY, 75, 10);           //Batwing
  rect(monsterX -20, monsterY +5, 45, 10);        //Batwing
  rect(monsterX -10, monsterY +10, 25, 10);       //Batwing
  rect(monsterX +30, monsterY, 75, 10);           //Batwing
  rect(monsterX +20, monsterY +5, 45, 10);        //Batwing
  rect(monsterX +10, monsterY +10, 25, 10);       //Batwing
  rect(monsterX -14, monsterY -78, 15, 10);       //Bathoorn
  rect(monsterX +14, monsterY -78, 15, 10);       //Bathoorn
  fill(255, 255, 0);                               //Kleur logo
  rect(monsterX, monsterY, 10, 10);                 //Logo
  fill(0, 0, 0);                                   //Kleur hoofd 
  ellipse(monsterX, monsterY -50, 60, 60);       //Hoofd
  fill(0, 0, 200);                                 //Kleur ogen
  ellipse(monsterX -10, monsterY -50, 16, 16);   //Linker oog
  ellipse(monsterX +10, monsterY -50, 16, 16);   //Rechter oog
  line(monsterX +10, monsterY +50, monsterX +30, monsterY +85);    //Rechter been
  line(monsterX -10, monsterY +50, monsterX -30, monsterY +85);     //Linker been
}
}

