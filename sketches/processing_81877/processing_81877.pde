
// Variablen: 

int winW = 400;
int winH = 300; 

//1.Spieler
int bPosX, bPosY; 
int bS    = 20;
int bSpX  = 1;
int bSpY  = 1; 

int blockW    = 20; 
int blockH    = 120;
int blockPosX, blockPosY, blockPosCenterY;

int countFails;


char blockMoveUp = 'q'; 
char blockMoveDown ='a'; 
int blockMoveStep = 5;


//2.Spieler
int blockW2    = 20; 
int blockH2    = 120;
int blockPosX2, blockPosY2, blockPosCenterY2, blockPosCenterX2;

int countFails2;

char blockMoveUp2 = 'o'; 
char blockMoveDown2 ='l'; 




int borderR, borderL, borderT, borderB;



//Fail 1. Spieler

void failCounter () { 
  if (bPosX < 0) {
  blockPosCenterY = winH/2 - blockH/2;
 blockPosY = blockPosCenterY;
    bPosX = blockW + bS/2;
 bPosY = blockPosY + blockH/2;
 countFails++;
 println("1. Spieler:" + countFails);
 
  blockPosCenterY2 = winH/2 - blockH2/2;
 blockPosY2 = blockPosCenterY2;
    bPosX = blockW2 + bS/2;
 bPosY = blockPosY2 + blockH2/2;


 
  }
}


//Fail 1. Spieler

void failCounter2 () { 
  if (bPosX > 400) {
  blockPosCenterY2 = winH/2 - blockH2/2;
 blockPosY2 = blockPosCenterY2;
    bPosX = blockW2 + bS/2;
 bPosY = blockPosY2 + blockH2/2;
 countFails2++;
 println("2. Spieler:" + countFails2);


 blockPosCenterY = winH/2 - blockH/2;
 blockPosY = blockPosCenterY;
    bPosX = blockW + bS/2;
 bPosY = blockPosY + blockH/2;

  }
}


/* _____________SEtup__________*/


void setup(){
  size(winW,winH);
  background(#499EBF);
  noStroke();
 
 //Balken/Ball immer in der Mitte 1.Spieler:
 
 blockPosCenterY = winH/2 - blockH/2;
 blockPosY = blockPosCenterY; 
 
 bPosX = blockW + bS/2;
 bPosY = blockPosY + blockH/2;
 
 //2.Spieler
  blockPosCenterY2 = winH/2 - blockH2/2;
  blockPosCenterX2 = winW - blockW2;
   blockPosY2 = blockPosCenterY2;
  blockPosX2 = blockPosCenterX2;
 
 //Grenzen: 
 borderR = winW-bS/2-blockW2;
 borderL = blockW+bS/2;
 
 borderT = bS/2;
 borderB = winH-bS/2;

 
 
}

/*_______________Draw___________*/
  
void draw(){ 

  background(#499EBF);
  
  //Geschwindigkeit + ballbewegung: 
  
  bPosX += bSpX;
  bPosY += bSpY;
  
  bPosX += bSpX;
  bPosY += bSpY;
  
  // Balkenbewegung + nicht weiter als der Display 1.Spieler
  
  if(keyPressed){
    
    if(key == blockMoveUp){
      blockPosY -= blockMoveStep;
      
    if(blockPosY < 0) {
      blockPosY = 0;}
      
    }
    else if (key == blockMoveDown){
      blockPosY += blockMoveStep;
      
  if(blockPosY+blockH > winH) {
      blockPosY =winH-blockH;}  
  }
    
  }
  
 if ( bPosX < borderL && bPosY>blockPosY && bPosY<blockPosY+blockH && bPosX>0) { 
    bSpX*=-1;
  }
  
 if (bPosY < borderT || bPosY > borderB) {
   bSpY*=-1;
 }
  
  
 // 2.Spieler: 
  
    
  if(keyPressed){
    
    if(key == blockMoveUp2){
      blockPosY2 -= blockMoveStep;
      
    if(blockPosY2 < 0) {
      blockPosY2 = 0;}
      
    }
    else if (key == blockMoveDown2){
      blockPosY2 += blockMoveStep;
      
  if(blockPosY2+blockH2 > winH) {
      blockPosY2 = winH-blockH2;}  
  }
    
  }
  
if (bPosX > borderR && bPosY>blockPosY2 && bPosY<blockPosY2+blockH2 && bPosX<winW) { 
    bSpX*=-1;
  }
  

 
 
  //Ballbewegung+begrenzung

  
  //1.Spieler:
  //Balken:
  rect(blockPosX,blockPosY,blockW,blockH);
  bPosX+=bSpX;
  //Ball:
  ellipse(bPosX,bPosY,bS,bS);
  
  
  //2.Spieler:
    //Balken:
  rect(blockPosX2,blockPosY2,blockW2,blockH2);
  bPosX+=bSpX;
failCounter();
failCounter2();
}
