
loat x=50; //posicio
float y=50; //posicio
float vx=5; //velocitat 
float vy=1;
//boolean esticDins=false;
float diametre=50;
float angulo=0;

void setup()
{
  size(800,600);
  background(255);  
  strokeWeight(5);
}

void draw()
{
  DibuixaFons();
  DibuixaObjecte();
  ControlVariables();
}  



void DibuixaFons()
{
  background(255);
  
}

void DibuixaObjecte()
{
  translate(x,y);
  rotate(radians(angulo));
  
  scale(0.5);  
  //el mateix dibuix de sempre
  fill(255,0,0);
  rect(-50,-50,100,100);
}
  
  
  
  
 


  
/////////////////////////////////////////////
  
void ControlVariables()
{
  x=x+vx;
  y=y+vy;
  angulo=angulo+1;
  
  if (x>width-diametre/2)
  {
    vx=vx*(-1);
  }
  if (x<diametre/2)
  {
    vx=vx*(-1);
  }
  if (y>height-diametre/2)
  {
   vy=vy*(-1); 
  }
  if (y<diametre/2)
  {
    vy=vy*(-1);
  }
}
