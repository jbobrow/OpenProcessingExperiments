
/*
 Autor: Roberto Plà Díaz
 SE-3 Informática
 2º GEDI ELISAVA
 */
 
int posX, posY, velX, velY;

 
void setup()
{
  size(1000, 800);
  posX = width/2;
  posY = height/2;
  velX = 4;
  velY = 4;
  smooth();
  noCursor();
  frameRate (24);
}
  
void draw()
{

posX = posX+velX;
posY = posY+velY;

personage (posX, posY);


if((posX<365)||(posX>width-405)){
    velX = -velX;
  } 
  
if((posY<310)||(posY>height-162))
    velY = -velY;

}

void personage(int _x,int _y)
{

float colourRange = map(_x, 0, 800, 10, 255);
  background(0);
  
  stroke(colourRange, _y, 100);
  strokeWeight(4);
  
  fill(0);
  ellipse(_x-200, _y-170, 330, 270); //Orejas
  ellipse(_x+200, _y-170, 330, 270);
  
  
  ellipse(_x, _y, 320, 320);//Cabeza
  
  
  arc(_x, _y, 290, 290, 0.08, 3.06); //Boca
  arc(_x, _y+10, 290, 20, 0.08, 3.06);
  
  fill(random(255),100,255,50);
   
  ellipse(_x-85, _y-40, 100, 100); //Ojos
  ellipse(_x+85, _y-40, 100, 100);
  }
  
void mousePressed(){

  posX=width/2;
  posY=height/2;
  
  }
