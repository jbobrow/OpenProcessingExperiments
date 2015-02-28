
void setup ()
{
  size (400,400);
  background (255,0,0);
  
}

void draw ()
{
 for (int x=0; x<900; x=x+10){
 for (int y=0; y<=900; y=y+10){
 fill ((x+y)*0.6);
bezier(90-(x/2.0), 20+x, 210, 10, 220, 150, 120-(x/8.0), 150+(x/4.0));

 strokeWeight (2); 
 
 }
 }
 }

