
//Copyright Christopher Henley 2014
//ICE17

final int MAX_FIGURES=10;
Figure allFigures[]=new Figure[MAX_FIGURES];

void setup(){
  size(400,400);
  initializeFigures();
}
void initializeFigures(){
  for (int i=0; i<allFigures.length; i++){
    allFigures[i]=new Figure();
    allFigures[i].setup();
  }
}

void draw(){
  background(0);
  for (int i=0; i<allFigures.length; i++){
    allFigures[i].moveFigures();
    allFigures[i].drawFigures();
  }
}
class Figure
{
 int x,y,dim,deltaX,deltaY;
 color col;
 
 void setup(){
   for (int i=0; i<allFigures.length; i++){
     x=int(random(width));
     y=int(random(height));
     deltaX=int(random(4));
     deltaY=int(random(4));
     dim=int(random(50));
     col=color(random(255),random(255),random(255));
   }
 }
 
 void moveFigures(){
   noFill();
   stroke(col);
   ellipse(x,y,dim,dim);
 }
 
 void drawFigures(){
   x+=deltaX;
   if (x>width || x<0){
     deltaX=-deltaX;
   }
   y+=deltaY;
   if (y>height || y<0){
     deltaY=-deltaY;
   }
 }
}
 



