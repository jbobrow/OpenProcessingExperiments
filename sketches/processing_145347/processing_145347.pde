
int posX, posY, velX, velY;

 
void setup()
{
  size(800, 800);
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

personaje (posX, posY);


if((posX<142)||(posX>width-142)){
    velX = -velX;
  } 
  
if((posY<192)||(posY>height-282))
    velY = -velY;

}

void personaje(int _x,int _y)
{

float colourRange = map(_x, 0, 800, 10, 255);
background(250,167,200);
  
stroke(1,1,1);
strokeWeight(6);
  
fill(250,167,200);

//Barbilla
arc(_x,_y +200,100, 150,0.2*PI,0.8*PI);
//Ceja Izquierda
arc(_x-400/5,_y-300/2.2, 400/5, 100,0.96*PI,2*PI);
//Ojo Izquierdo
arc(_x-400/5,_y+1, 114.2, 200,0.96*PI,2*PI);

//Ceja Derecha
arc(_x+400/5,_y-300/2.2, 400/5, 100,0.96*PI,2*PI);

//Ojo Derecho
arc(_x+400/5,_y, 114.2, 200,0.96*PI,2*PI);


//Dibujamos la de la Elipse boca
fill (0,0,0);
ellipse(_x,_y+150,80,200);

//Dibujamos el arco de la elipse de la lengua
stroke (255,30,30);
fill (255,30,30);
arc(_x,_y+196, 48, 100,0,PI);

//Redondeo superior de la lengua
ellipse(_x,_y+196,47,24);

//Mueca inferior
ellipse(_x,_y+196,47,24);

//Mueca superior
stroke (255,255,255);
fill (255,255,255);
arc(_x,_y+107,44.5, 100,PI,2*PI);

//Redondeo inferior de los dientes en blanco
ellipse(_x,_y+107,44.4,8);

  }
  
void mousePressed(){

  posX=width/2;
  posY=height/2;
  
  }



