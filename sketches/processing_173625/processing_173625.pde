

PImage tierra; 
int globalX =6;
int globalY= 100;
int velocidad =20;
int velocidad2 = 10; 

void setup (){
  
  size (1200,800);
 tierra = loadImage("foto.jpg");

  
  smooth ();     //para suavisar
}

void draw (){
  background (0);
  image(tierra, 0, 0);
  viaja ();
  rebote ();
  drawCar (globalX, 400, 100,79);
  drawCar (globalX, 600,200,150);
  drawCar (globalX, globalY, 50, 20);
}

 void viaja (){
   globalX = globalX + velocidad;
   globalY = globalY + velocidad2;
 }
 void rebote (){
   if (( globalX > width ) || (globalX < 0)) {   //if es "si"
    velocidad = velocidad *-1;
 }
   if (( globalY > height ) || (globalY < 0)) { 
    
     velocidad2 =velocidad2 *-1; 
 }
 }

 
  void drawCar (int x, int y, int theSize, color c) {
   int offset = theSize/4;
  rectMode (CENTER);
 stroke (200);
fill (c);
ellipse (x,y,theSize/2, theSize/2 );
fill (06,28,113);
ellipse (x,y,theSize/4, theSize/4 );
    
ellipse (x-offset, y-offset, offset/2,offset/2);
ellipse (x+offset, y-offset, offset/2,offset/2);
ellipse (x-offset, y+offset, offset/2,offset/2);
ellipse (x+offset, y+offset, offset/2,offset/2);
 }
 
   
