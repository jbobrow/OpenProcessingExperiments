
float posx;
float posx1;
float posx2;

float posy;
float posy1;
float posy2;

float velocidadx;
float velocidady;

void setup() 
{
  size(500, 500);
  noStroke();
  background(200);
  fill(0, 100, 150, 200);
  smooth();
  
  velocidadx=3;
  velocidady=3;
  
  posx=0;
  posx1=25;
  posx2=width-25;
  
  posy=0;
  posy1=25;
  posy2=height-25;
 
}

void draw() 
{
  background(200);
  ellipse(posx, posy,50,50);
  posx =posx+velocidadx;
  posy =posy+velocidady;
  
  if(posx>=posx2)
  {
  velocidadx=-5;
  }
  
  if (posx<=posx1)
  {
    velocidadx=5;
  }
  
  if(posy>=posy2)
  {
  velocidady=-3;
  }
  
  if (posy<=posy1)
  {
    velocidady=3;
  }
   velocidady=velocidady+0.3;
}
