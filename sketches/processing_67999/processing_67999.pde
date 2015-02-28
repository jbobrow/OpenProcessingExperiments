
float a=0.0;

void setup()
{
size(500,500);
background(#000000);
smooth();
}

void draw()
{

   background(#000000);
   fill(255,255,0);
   arc(170,170,150,150,PI/4+a,PI+QUARTER_PI+2+a);
   a+=0.05;

   fill(255,255,0);
   arc(170,170,150,150,PI/4,PI+QUARTER_PI+2);

   fill(#000000);
   strokeWeight(25);
   arc(130,130,50,50,0,0);

   fill(#FFFFFF);
   ellipse(265,200,50,50);
   
     
}
