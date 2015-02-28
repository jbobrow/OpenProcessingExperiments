
//Dale movimiento con las fechas //

int x=25;
int y=25;
float rotacion=0;
float incremento=0.1;
void setup()
{
  size(300,300); 
  background(0); 
}
void draw()
{
  strokeWeight(4);
  pacman();
  if(keyPressed)
    {     
      if(keyCode==DOWN && y<=height-30)
      {
        background(0);
        pacman();
        y+=2;
      }
      if(keyCode==UP&& y>=height-270)
      {
        background(0);
        pacman();
        y-=2;
      }
      if(keyCode==LEFT&& x>=width-270)
      {
        background(0);
        pacman();
        x-=2;
      }
      if(keyCode==RIGHT&& x<=width-30)
      {
        background(0);
        pacman();
        x+=2;
      } 
    } 
}

void pacman()
{ 
  if(rotacion>0.6)
  {
    incremento=-0.05;
  }
  else if(rotacion<=0)
  {
    incremento=0.05;
  }
  background(0);
  fill(255,255,0);
  noStroke();
  rotacion+=incremento;
  arc(x,y,50,50,rotacion,TWO_PI-rotacion);
}


