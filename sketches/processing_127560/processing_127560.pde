
int x=30;
int y=30;

int dx=5;
int dy=1;

void setup(){
  size(600,600);
  background(100);
}
void draw()}
  fill(0,255,0)
  ellipse(x,y,20,20);
  fill(255,0,0)
  ellipse(x,y,10,10);
 
  
  x = x + dx;
  y = y + dy;
  
  if ( x > 570 )
  {
      dx = -5;
  }
  
  else if (x < 30)
  {
       dx = 5;
  }
  
  if (y > 570)
  {
       dy *= -1;
  }
  else if (y < 30 )
  {
        dy *= -1;
  }
}
