
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
rect(x,y,10,10);

 strokeWeight (2); 
 
 }
 }
 }

