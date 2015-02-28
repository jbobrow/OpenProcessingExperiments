
// HW5 
// copyright carl bajandas 2011 pittsburgh, PA 

int y = 0 ;
int x = 400;
int space = 20;

void setup ()
  {
  size (400, 400);
  background(0);
  }


void draw ()
{
  y = 0 ;

  while ( y <= 400)
  {
 
   if (y%2 == 0 )
  {
  fill (0, 50); 
  } 
    else 
    {
    fill (random(50), random (50), random (250), 50); 
  
    }
  rect (0,  y, 400, y);
  y= y +15;
  }
}

                
                
