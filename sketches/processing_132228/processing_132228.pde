
int monsterX;
int monsterY;
boolean outsideMonster;
 
int spatie;
int lineY;

int count = 0;
boolean vormTest;
 
//hier moet ergens een loop
 
void setup() {
  size(500, 500);
  monsterX = 400;
  monsterY = 400;
 
  spatie = 10;
  
    vormTest = false;
}
 
void draw() {
  background(255);                               //Achtergrond kleur
  
  teller();
  text(count, 10, 50);
  
  
  if (vormTest == false){
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
  
while (lineY < 800) {
    stroke(0);
    line(800, lineY, 0, lineY);
    lineY += spatie;
  }
 
  lineY = 0;
  monsterX = mouseX;
 
  if (monsterY > 500) {
    outsideMonster = true;
  }
 
  if (outsideMonster == true) {
    monsterY -= 4;
  }
 
  if (outsideMonster == false) {
    monsterY += 4;
  }
 
  if (monsterY < 0) {
    outsideMonster = false;
  }
}
 
 void teller() {
  if (monsterY > height || monsterY < 0) {
    count += 1;

    print(count);
  }
  
  if (count > 2){
    vormTest = true;
  }

  if (vormTest == true) {
    tekenBatmanKleur();
  }

  if (count == 6) {
    count = 0;
    vormTest = false;
  }
 }
 
 
  

void tekenBatmanKleur(){
    rectMode(CENTER);                              //Vierkant in het midden
  fill(255, 0, 0);                                   //Kleur lichaam 
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

