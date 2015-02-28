
//Matheson G. Mods:14/15 Computer Programming 1 
float x = 360;
float x1=300;
float ar=275;
float change = 0.5;
float archange=0.9;
float change1=1.1;
void setup()
{
  size(300,300);
}
void draw()
{
  background(0);
  //orange circle 
  fill(245,182,7);
  ellipse(x1,150,30,30);
  //yellow pacman
  fill(245,237,7);
  arc(x,150,40,40,-3*PI/4,3*PI/4);
  //blue circle 
  fill(44,212,240);
  ellipse(ar,150,30,30);
  //eyes 
  fill(0,0,0);
  ellipse(x,140,5,5);
  fill(255,255,255);
  x1=x1+change1;
  x = x + change;
  ar=ar+archange;
  
   if(x1 > 300)
  {
   change1=-1.00000000001;
  }
  
  
  if(ar>300)
  {archange=-1.0005;
  
  } 
  if(x > 300)
  {
    change = -1;
  }
  
}
