

PFont font;
PFont font2;
float x=200;
float y=60;
float a=320;
float b=500;



void setup()
{
  size (500,500);
  
  font = loadFont("janik.vlw"); 
 
}

void draw ()
{
 
  background(0,0,0);
 
  
  fill(255,0,0);
  textFont(font); 
  text("Arne",x, y);
  if (y<250)  y=y+0.5;
  
  textFont(font); 
  text("Arne",x, y);
  text("21a",a,b);
   if (b<250);
   b=b-0.5 ;
   if(b<250)
   {
     b=250;
   }
}


