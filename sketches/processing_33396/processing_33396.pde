
/*
Eizabeth Clare
ForLoops
Aug 8th
*/


PImage northpole;
PImage Bear1;
PImage Bear2;
PImage Penguin1;
float xPos;
float yPos;
float Bear1xPos;
float Bear1yPos;
int numBear1;
int numBear2;
int numPenguin1;


void setup (){
  
  size(450, 350);
  background (#000000);
  northpole=loadImage("northpole.png");

  Bear1=loadImage("bear1.png");
  Bear2=loadImage("bear2.png");
   Penguin1=loadImage("penguin1.png");
xPos=50;
yPos=200;
numBear1=40;
numBear2=25;
numPenguin1=50;
}

void draw (){
     image(northpole, 0, 0);
      Bear1yPos = random(205, 210);
  yPos = random(205, 210);
  smooth();

 for(int i = 0; i < numPenguin1; i++){
        image(Penguin1, xPos + 700*i, yPos-200);}

    
    for(int i = 0; i < numBear1; i++){
        image(Bear1, xPos + 500*i, yPos);      
}

for(int i = 0; i < numBear2; i++){
        image(Bear2, xPos + 300*i, yPos+50);}
        
        xPos-=10; 
        Bear1yPos +=20;
        
      
}



