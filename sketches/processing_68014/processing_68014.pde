
// Armando Rocha

int n=0,x=0;
void setup()
{
size(500,500);
smooth();
 background(0);
 frameRate(7);
}
void draw()
  {
    background(0);
    if(n==0)
    {
   //AMARILLO
   fill(255,255,0);
    arc(200,200,200,200,PI/20,PI+2.5);
   // bolitas blancas
   fill(250,255,255);
   ellipse(460-x,185,20,20);
   ellipse(668-x,185,20,20);
   x+=10;
   if(x==220)
   {
     x=0;
     }
    n=1;
    }
else{
    fill(255,255,0);
    arc(200,200,200,200,0,TWO_PI);
    n=0;
    }
    //ojo
    fill(0,0,0);
   ellipse(170,150,22,22);
   // moño
   fill(255,0,0);
   triangle(130,270,200,300,130,330);
   triangle(200,300,270,270,270,330);
  }
