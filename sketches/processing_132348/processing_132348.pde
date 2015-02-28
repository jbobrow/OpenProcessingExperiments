

int monsterX;
int monsterY;
int richting;
int teller;
boolean test;
 
float i=50;
 
int y;
int spatie;
int stop;
int breedte;
int hoogte;
  
 
void setup(){
size(500,500);
monsterX = 100;
monsterY = 100;
richting = 10;
teller = 0;
test = true;
spatie = 10;
stop = height;
breedte = 10;
}
 
void draw(){
background(255,255,255);
strokeWeight(2);
stroke(200,50,50);
ellipseMode(CENTER);
background(255);
 
loopRegen();
updateX();
moveRand();
tekenMonster();
}
 
 
void loopRegen() {
 
  
  fill(100, 30, 20);
  
  if (test == true) {
    fill(0);
  }
  else if (test == false) {
    fill(55, 0, 0);
  }
  strokeWeight(1);
      for(int i=0; i < 100; i ++){
    stroke(100,60,60);
  ellipse(random(0,500),random(0,500),1,75);
     
   }
  while (i > 500) { i = 0; }
    
  strokeWeight(3);
  
 stroke(96, 0, 0);
}
 
void updateX() {
 
monsterY = monsterY + richting;
}
 
void moveRand () {
  
  if(monsterY > 450 || monsterY <-60){
    richting= -richting;
    teller = teller+1;
  }
    
  if(teller == 10){
teller=0;
test =!test;
 
  }
}
 
void tekenMonster (){
 
rect(monsterX -20,monsterY +60,40,65);  //linker been
rect(monsterX +70,monsterY +60,40,65);  //rechter been
rect(monsterX -90,monsterY -50,60,30);  //linker arm
rect(monsterX +120,monsterY -50,60,30);  //rechter arm
fill(0,0,255);
ellipseMode(CENTER);
ellipse(monsterX +45,monsterY -20,200,210); //lichaam
ellipse(monsterX +45,monsterY -170,180,180); //hoofd
 
//armen, mond en navel
 
 if( test == true){
   fill(255,0.0);
 }
 else {
   fill (0,255,0);
 }
    
fill(0,0,0);
ellipse(monsterX +45,monsterY -115,64,32); //mond
fill(0,0,0);
ellipse(monsterX +40,monsterY -155,4,16); //rechterneusgat
ellipse(monsterX +55,monsterY -155,4,16); //linkerneusgat
 
// ogen
fill(0,0,0);
ellipse(monsterX +15 ,monsterY -175,32,64); //linker oog
fill(255,255,255);
ellipse(monsterX +15,monsterY -175,8,16); //linker pupil
fill(0,0,0);
ellipse(monsterX +80,monsterY -175,32,64); //rechter oog
fill(255,255,255);
ellipse(monsterX +80,monsterY -175,8,16); //rechter pupil
println(teller);
}

