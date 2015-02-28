
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
stroke(0);
fill(0,0,0);
rect(monsterX -20,monsterY +60,40,65);  //linker been
rect(monsterX +70,monsterY +60,40,65);  //rechter been
rect(monsterX -90,monsterY -50,60,30);  //linker arm
rect(monsterX +120,monsterY -50,60,30);  //rechter arm
fill(0,0,255);
ellipseMode(CENTER);
ellipse(monsterX +45,monsterY -20,200,210); //lichaam
ellipse(monsterX +45,monsterY -170,180,180); //hoofd
fill(0,0,0);
ellipse(monsterX +15 ,monsterY -175,32,64); //linker oog
fill(255,255,255);
ellipse(monsterX +15,monsterY -175,8,16); //linker pupil
fill(0,0,0);
ellipse(monsterX +80,monsterY -175,32,64); //rechter oog
fill(255,255,255);
ellipse(monsterX +80,monsterY -175,8,16); //rechter pupil
 
fill(0,0,0);
ellipse(monsterX +45,monsterY -115,64,32); //mond
fill(0,0,0);
ellipse(monsterX +40,monsterY -155,4,16); //rechterneusgat
ellipse(monsterX +55,monsterY -155,4,16); //linkerneusgat
}
}
