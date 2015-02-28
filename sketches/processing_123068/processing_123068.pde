
int monsterpositionX;
int monsterpositionY;
int breedte;
int hoogte;
int richting;
int teller;
boolean test;

void setup (){
  size(500,500);
 background(150);
breedte = 50;
hoogte = 50;
richting = -50;
teller = 0;
}

void draw(){
background(255);
if(test == true){
  fill(0,255,0);
}
if(test == false){
  fill(255,0,0);
}
ellipse(monsterpositionX +100,monsterpositionY +100,100,100);//hoofd
ellipse(monsterpositionX +75,monsterpositionY +100,25,25); //  linker oog
ellipse(monsterpositionX +125,monsterpositionY +100,25,25);//  rechter oog
line(monsterpositionX +125,monsterpositionY +125,monsterpositionX +75,monsterpositionY +125);//    mond
line(monsterpositionX +100,monsterpositionY +150,monsterpositionX +100,monsterpositionY +300);//   lijf
line(monsterpositionX +100,monsterpositionY +200,monsterpositionX +50,monsterpositionY +150);//    linker arm
line(monsterpositionX +100,monsterpositionY +200,monsterpositionX +150,monsterpositionY +150);//   rechter arm
line(monsterpositionX +100,monsterpositionY +300,monsterpositionX +60,monsterpositionY +350);//    linker been
line(monsterpositionX +100,monsterpositionY +300,monsterpositionX +140,monsterpositionY +350);//   rechter been

monsterpositionX = monsterpositionX;


monsterpositionX = monsterpositionX + richting;
if(monsterpositionX >500 || monsterpositionX <0){
  richting = -richting;
  teller = teller +1;
}
if(teller == 10){
  teller= 0;
  test= !test;
}
}

