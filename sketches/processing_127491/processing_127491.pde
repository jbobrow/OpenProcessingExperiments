
int monsterX;
int monsterY;
boolean outsideMonster;

int spatie;
int lineY;

//hier moet ergens een loop

void setup() {
  size(800, 800);
  monsterX = 400;
  monsterY = 400;

  spatie = 10;
}

void draw() {
  background(255);                               //Achtergrond kleur
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

monsterY -= 1;


}

