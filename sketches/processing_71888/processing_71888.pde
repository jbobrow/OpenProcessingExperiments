
PFont tipo_letra;
char[] mi_nombre={'D','A','N','I','E','L'};
int x=1,y=2,x2=3,y2=4,x3=5,y3=6,x4=7,y4=8,x5=9,y5=10,x6=11,y6=12;
 
void setup()
{ 
  size(800,400);  
}
 
void draw()
{
  background(0,0,255);
  tipo_letra=loadFont("Bauhaus93-48.vlw");
 
  textFont(tipo_letra, 30);
   
  if(x != 300 && y != 200)
     {
        x=int(random(0,800));
        y=int(random(0,400));
        text(mi_nombre[0],x,y);
     }
  else
     {
         x=300;
         y=200;
         text(mi_nombre[0],x,y); 
     }
 
  if(x2 != 340 && y2 != 200)
    { 
        x2=int(random(0,800));
        y2=int(random(0,400));
        text(mi_nombre[1],x2,y2);
    }
  else
     {
       x2=340;
       y2=200;
       text(mi_nombre[1],x2,y2); 
     }
      
  if(x3 != 360 && y3 != 200)
    { 
      x3=int(random(0,800));
      y3=int(random(0,400));
      text(mi_nombre[2],x3,y3);
    }
  else
     {
       x3=360;
       y3=200;
      text(mi_nombre[2],x3,y3); 
     }
      
  if(x4 != 400 && y4 != 200)
    {
      x4=int(random(0,800));
      y4=int(random(0,400));
      text(mi_nombre[3],x4,y4);
    }
  else
    {
       x4=400;
       y4=200;
       text(mi_nombre[3],x4,y4);
    }
     
  if(x5 != 420 && y5 != 200)
    {
      x5=int(random(0,800));
      y5=int(random(0,400));
      text(mi_nombre[4],x5,y5);
    }
  else
     {
       x5=420;
       y5=200;
       text(mi_nombre[4],x5,y5); 
     }
    
   if(x6 != 450 && y6 != 200)
    {
      x6=int(random(0,800));
      y6=int(random(0,400));
      text(mi_nombre[5],x6,y6);
    }
  else
     {
       x6=450;
       y6=200;
       text(mi_nombre[5],x6,y6); 
     } 
}
