

int monsterposX;
int monsterposY;
 
int richting;
int teller;
 
boolean test;
 
int y;
int spatie;
int stop;
int breedte;
int hoogte;
 
float i = 50;
 
void setup() {
  size(500, 500);
  background(100);
  monsterposX = 250;
  monsterposY = 400;
  richting = 5;
  teller = 0;
  test = true;
  y = 0;
  spatie = 30;
  stop = height;
  breedte = 10;
  hoogte = 10;
   frameRate(60);
}
void draw() {
  background(0);
  strokeWeight(3);
  stroke(5, 0, 0);
  fill(200, 60, 40);
 
  if (test == true) {
    fill(0);
  }
  else if (test == false) {
    fill(55, 0, 0);
  }
  strokeWeight(1);
      for(int i=0; i < 50; i ++){
    stroke(random(125), random(125), random(125));
  ellipse(random(0,500),random(0,500),1,75);
    
   }
  while (i > 500) { i = 0; }
   



rect(monsterposX -20,monsterposY +60,40,65);  //linker been
rect(monsterposX +70,monsterposY +60,40,65);  //rechter been
rect(monsterposX -90,monsterposY -50,60,30);  //linker arm
rect(monsterposX +120,monsterposY -50,60,30);  //rechter arm
fill(0,0,255);
ellipseMode(CENTER);
ellipse(monsterposX +45,monsterposY -20,200,210); //lichaam
ellipse(monsterposX +45,monsterposY -170,180,180); //hoofd
fill(0,0,0);
ellipse(monsterposX +15 ,monsterposY -175,32,64); //linker oog
fill(255,255,255);
ellipse(monsterposX +15,monsterposY -175,8,16); //linker pupil
fill(0,0,0);
ellipse(monsterposX +80,monsterposY -175,32,64); //rechter oog
fill(255,255,255);
ellipse(monsterposX +80,monsterposY -175,8,16); //rechter pupil
 
fill(0,0,0);
ellipse(monsterposX +45,monsterposY -115,64,32); //mond
fill(0,0,0);
ellipse(monsterposX +40,monsterposY -155,4,16); //rechterneusgat
ellipse(monsterposX +55,monsterposY -155,4,16); //linkerneusgat


  monsterposX = mouseX;
  monsterposY = monsterposY - richting;
 
  println(teller);
 
  if (teller == 10) {
    teller = 0;
    test = !test;
  }
  if (monsterposY < 0 + 100) {
    richting = -richting;
    teller = teller +1;
  }
  if (monsterposY > 500 - 100) {
    richting = -richting;
  }
   
 
 
 
}
