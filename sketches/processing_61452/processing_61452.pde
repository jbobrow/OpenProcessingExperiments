
PFont mivariableTipo1;

int posX;
int posY;
int incremento;
int p;

 void setup()
 {
   size(2500,500);
   mivariableTipo1=loadFont("Arial-Black-48.vlw");
   textFont(mivariableTipo1);
   frameRate(15);
   posX=10;
   posY=100;
   incremento=0;
   
 }
 
 void draw()
 {
   background(1);
   textSize(p);
   if (mousePressed)
   {
     posX=10;
     incremento=0;
   }
   text("O",posX,posY);
   posX=posX+1;
    text("F",posX+incremento,posY);
   posX=posX+1;
   incremento++;
    text("F",posX+100,posY);
   posX=posX+1;
   text("F",posX+incremento*2,posY);
   posX=posX+1;
   incremento++;
   text("F",posX+incremento*3,posY);
   posX=posX+1;
   incremento=incremento+1;
   p=p+5;
   if(posX >300) ;

 }

