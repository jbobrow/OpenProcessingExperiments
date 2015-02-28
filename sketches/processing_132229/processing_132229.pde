
int monsterX;
int monsterY;
int breedte;
boolean outsideMonster;

int spatie;
int lineY;

//hier moet ergens een loop

void setup() {
  size(800, 300);
  monsterX = 400;
  monsterY = 400;
  breedte = width/120;
  spatie = 10;
}

void draw() {
  background(255);

  for (int i = 0; i < breedte; i++) {
    tekenMonstertjes(75+(i*150), 150);
  }

}

void tekenMonstertjes(int x, int y) {
  rectMode(CENTER);                              //Vierkant in het midden
  fill(0, 0, 0);                                   //Kleur lichaam  
  rect(x, y, 20, 100);              //Lichaam
  rect(x -30, y, 75, 10);           //Batwing
  rect(x -20, y +5, 45, 10);        //Batwing
  rect(x -10, y +10, 25, 10);       //Batwing
  rect(x +30, y, 75, 10);           //Batwing
  rect(x +20, y +5, 45, 10);        //Batwing
  rect(x +10, y +10, 25, 10);       //Batwing
  rect(x -14, y -78, 15, 10);       //Bathoorn
  rect(x +14, y -78, 15, 10);       //Bathoorn
  fill(255, 255, 0);                               //Kleur logo
  rect(x, y, 10, 10);                 //Logo
  fill(0, 0, 0);                                   //Kleur hoofd  
  ellipse(x, y -50, 60, 60);       //Hoofd
  fill(0, 0, 200);                                 //Kleur ogen
  ellipse(x -10, y -50, 16, 16);   //Linker oog
  ellipse(x +10, y -50, 16, 16);   //Rechter oog
  line(x +10, y +50, x +30, y +85);    //Rechter been
  line(x -10, y +50, x -30, y +85);     //Linker been
}

