

int X;
int Y;
int breedte;
boolean outsideMonster;
 
int spatie;
int lineY;
 
//hier moet ergens een loop
 
void setup() {
  size(800,800);
  X = 400;
  Y = 400;
  breedte = width/120;
  spatie = 10;
}
 
void draw() {
  background(255);
 
  for (int i = 0; i < breedte; i++) {
    tekenVarken(75+(i*150), 150);
  }
 
}
  
void tekenVarken(int x, int y){ // het monster tekenen
stroke(0);
fill(0,0,0);
rect(X -20,Y +60,40,65);  //linker been
rect(X +70,Y +60,40,65);  //rechter been
rect(X -90,Y -50,60,30);  //linker arm
rect(X +120,Y -50,60,30);  //rechter arm
fill(0,0,255);
ellipseMode(CENTER);
ellipse(X +45,Y -20,200,210); //lichaam
ellipse(X +45,Y -170,180,180); //hoofd
fill(0,0,0);
ellipse(X +15 ,Y -175,32,64); //linker oog
fill(255,255,255);
ellipse(X +15,Y -175,8,16); //linker pupil
fill(0,0,0);
ellipse(X +80,Y -175,32,64); //rechter oog
fill(255,255,255);
ellipse(X +80,Y -175,8,16); //rechter pupil
 
fill(0,0,0);
ellipse(X +45,Y -115,64,32); //mond
fill(0,0,0);
ellipse(X +40,Y -155,4,16); //rechterneusgat
ellipse(X +55,Y -155,4,16); //linkerneusgat
}

