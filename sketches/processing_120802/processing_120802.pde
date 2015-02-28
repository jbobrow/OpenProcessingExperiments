
float x=50; //posicio
float y=50; //posicio
float vx=5; //velocitat 
float vy=1;
//boolean esticDins=false;

float diametre=50;

void setup()
{
  size(800,600);
  background(255);  
  strokeWeight(5);
}

void draw()
{
  background(255); 
  DibuixaSmiley();
  ControlVariables();
}  
  
  
void DibuixaSmiley()
{ 
  fill(#FCF10F);
  ellipse(x,y, diametre, diametre);
  DibuixaUlls();
} 

void DibuixaUlls()
{
  noFill();
  ellipse(x-10, y-10,2,2);
  ellipse(x+10, y-10, 2,2);
}
  
  
/////////////////////////////////////////////
  
void ControlVariables()
{
  x=x+vx;
  y=y+vy;

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
