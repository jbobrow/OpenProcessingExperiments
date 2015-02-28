
int x;
int vx;

int y;
int vy;

int r;


void setup()
{
  background(0);
  size(600,400);
  
  //declaramos valores iniciales para x,y
  x=int(random(0,width));
  y=int(random(0,height));
  
  //declaramos que la velocidad sea random
  vx=int(random(1,9));
  vy=int(random(1,9));
  
  r=20;
  
}

void draw()
{
  //ponemos background para que la pelota se vaya viendo
  background(0);
 
  //escribimos ecuación de la elipse
  ellipse(x,y,r,r);
  
  //establecemos rebote X
  if((x<10)||(x>width-10)) {
  vx=-vx;
  }
  
  x=x+vx;
  
  //establecemos rebote Y
  if((y<10)||(y>height-10)) {  
  vy=-vy;
  }
  
  y=y+vy;
}
