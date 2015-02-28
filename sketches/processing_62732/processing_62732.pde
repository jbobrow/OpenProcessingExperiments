
int w = 800; int h = 600;
boolean flagX = true; boolean flagY = true;

float cx = w/15; float cy = h/10;

float x,y,angulo, radio, delta;

void setup()
{
  size(800,600);
  background(0);
  strokeWeight(3);
  angulo = 0; delta = 0;
  radio = w/5;
}

void draw()
{
  
  angulo+= delta;
  
  if(flagX) { x = cx + ( radio + delta * cos(angulo));}
  if( x > w ) {flagX = !flagX; }
  
  if(!flagX) { radio -= 1; 
               x -= cx - ( radio + delta * sin(angulo));
             }
             
  if ( x <= cx ) { flagX = true; }
  
  
  
  if(flagY) { y = cy + (radio  + delta * sin( angulo)); }
  if( y > h ) { flagY = !flagY; }
  
  if(!flagY) { radio -= 1; 
               y -= cy - (radio  + delta * cos( angulo));
             }
             
  if( y <= cy) { flagY = true; }
  
  
  stroke((x+y)/2,x%5,y%5);
  point(x,y + 100);
  
  stroke(x%5,(x+y)/2, y%5);
  point( x + 200,y + 100);
  
  stroke(x%5,y%5,(x+y)/2);
  point( x + 400, y + 100);
  
  if( angulo60 == 0)
  { delta+= 5; }
  
}// end draw
