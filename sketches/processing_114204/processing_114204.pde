
//tamany de la pantalla
int sizeX = 800;
int sizeY = 500;
//color RGB del background
float bgR = 150;
float bgG = 50;
float bgB = 50;
//color RGB del fill
float fR = 50;
float fG = 50;
float fB = 50;
//moviment linies
float Y1=sizeY/2;
float X1=sizeX/2;
//quadrat
float XC=5;
float YC=5;
//linies fora de canvas
boolean LF=false;
//conmptador linies diagonals
float C = 0;


void setup () {
  size (sizeX,sizeY);
  background (bgR,bgG,bgB);
  smooth ();
  strokeWeight (2);
  stroke (fR,fG,fB);
  noFill ();
  
}

void draw () {
  
  background (bgR,bgG,bgB);
  stroke(250,240,240);
  Diagonal ();
  quad (sizeX-XC,sizeY-YC,sizeX-XC,YC,XC,sizeY-YC,XC,YC); //XC,YC);//                 sizeX/2-XC,sizeY/2-YC,sizeX/2+XC,sizeY/2-YC,sizeX/2-XC,sizeY/2+YC,sizeX/2+XC,sizeY/2+YC);
  if(/*Y1>=sizeY||Y1<=0||*/X1>=sizeX||X1<=0) LF=!LF;
  if (!LF&&(X1<=sizeX)) { X1+=1; }
  if (!LF&&(Y1<=sizeY)) { Y1+=1; }
  if (LF) {if(X1>=0){X1-=1;} if (Y1>=0) {Y1-=1;} }
  println (X1);
  println ("Y1-"+Y1);
 stroke (fR,fG,fB);
  line(0,Y1,sizeX,Y1);
  line(X1,0,X1,sizeY);
  
  line(0,sizeY-Y1,sizeX,sizeY-Y1);
  line(sizeX-X1,0,sizeX-X1,sizeY);
    
}

void Diagonal () {
 
  C=C+0.05;
  if(Y1==sizeY/2||X1==sizeX/2) C=C*0.1;
   
  
  XC=X1-25+random(C);
  YC=Y1-25+random(C); 
}


