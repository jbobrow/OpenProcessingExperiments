
void setup ()
{
  size (400,400);
  background (100);
  
}

void draw ()
{
 for (int x=0; x<900; x=x+10){
 for (int y=0; y<=900; y=y+10){
 fill ((x+y)*0.6);
triangle(x/2,y*2,x*3,y*7,x/5,y/2);

 strokeWeight (2); 
 
 }
 }
 }

