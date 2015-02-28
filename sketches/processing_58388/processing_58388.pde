
PShape A;
PShape E;
PShape B;
PShape M;
int spacing =6;
int x =30;
int r= 40;
int d =90;
int g= 200;
float aPos= -200;
float ePos= -300;
float bPos= -300;
float mPos= -20;
boolean button= false;



void setup(){
  background(250);
  size(500,300);
  smooth();
  shapeMode(CENTER);
  A= loadShape("A.svg");
  E= loadShape("E.svg");
  B= loadShape ("B.svg");
  M= loadShape("M.svg");
}

void draw() {
  background(250);
  //orange octagon top
  for (int x= 100; x<width;x=x+150){
    shape(A,x+ePos,height/2,50,60);
    //shape(E,epos,295,66,55);
  }
      
  //eyeball
 for (int r= 40; r<width;r=r+99){
  shape(E,r+ePos,height/4,50,70);
 }
 
 

  //biggreen octagon
for (int d =28; d<width;d=d+70){
shape(B,d/ePos,height/2,47,90);
}

for( int g= 60; g<width;g=g+28){
shape(M,g-ePos,height/9,19,20);
}
 
  ePos=ePos+1;
 if(ePos>width){
      ePos= 0;
 }
}

