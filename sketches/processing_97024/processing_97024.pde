
//marquem les variables que utilitzarem//

float distX;
float distY;
float beginX = 250;  
float beginY = 300;  
float endX = 500.0;   
float endY = 300.0;
float posx,posy,velx,vely,r;
float step=0.02;
float pct =0;
float exponent=5;

//fons d'imatge//
void setup()

{
  background(#124DFA);
  size(500,600);
  posx=width/2;
  posy=height/2;
  velx=3;
  vely=3;
}

//dibuixem el comecocos//
void draw()
{

 background(#124DFA);
 noStroke ();
 stroke (#124DFA);
 fill (#000103); 
 ellipse (posx,posy,60,60);
 fill (#124DFA);
 triangle (posx,posy,posx+30,posy+15,posx+30,posy-15);
 ellipse (posx+5,posy-16,9,9);
 
//dibuixem el menjar del comecocos que seguirá el mouse//
 fill (mouseX,50,mouseY);
 ellipse (mouseX,mouseY,15,15);
  
//fem que el comecocos no es surti del limit de la finestra//
 posx=posx+velx;
 posy=posy+vely;
 
if(posx<0||posx>width){
  velx=-velx;
}
if(posy<0||posy>height){
  vely=-vely;
}
pct += step;
  if (pct < 1.0) {
    posx = beginX + (pct* distX);
    posy = beginY + (pow(pct, exponent) * distY);
}
}

//amb aquest comandament fem que el comecocos vagi cap al menjar cada vegada que fem un "click"//
void mousePressed(){
  pct=0.0;
  beginX = posx;
  beginY = posy;
  endX = mouseX;
  endY = mouseY;
  distX = endX - beginX;
  distY = endY - beginY;
}



