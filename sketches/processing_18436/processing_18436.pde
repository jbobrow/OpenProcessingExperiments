
// Jugando Con Numeros
// Seminario de Matematicas
// Jan 24, 2011: Chris Sugrue.

int x,y;

void setup()
{
  size(550,300);
  x = width/2;
  y = height/2;
 smooth();
}


void draw()
{
  
  background(0);
    
  stroke(255);
  float radius=dist(mouseX,mouseY,x,y) / 2.0;

  fill(255);
  
  // loop full circle at 10 degree intervals and draw circle at each rotation
  for( int i = 0; i < 360; i+= 10 )
  {
    float xA = x + radius * cos(radians(i));
    float yA = y + radius * sin(radians(i));
    
    ellipse(xA,yA,20,20);
    line(x,y,xA,yA);
  }
 
    
}



