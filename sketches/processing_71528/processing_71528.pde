
PFont tipo_letra;
char[] mi_nombre={'R','O','D','R','I','G','O'};
int x=1,y=2,x2=3,y2=4,x3=5,y3=6,x4=7,y4=8,x5=9,y5=10,x6=11,y6=12,x7=13,y7=14;
 
void setup()
{ 
  size(800,400);  
}
 
void draw()
{
  background(0);
  tipo_letra=loadFont("Andalus-48.vlw");
 
  textFont(tipo_letra, 42);
 // LETRA R..................  
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
 // LETRA O..................  
  if(x2 != 350 && y2 != 200)
    { 
        x2=int(random(0,800));
        y2=int(random(0,400));
        text(mi_nombre[1],x2,y2);
    }
  else
     {
       x2=350;
       y2=200;
       text(mi_nombre[1],x2,y2); 
     }
   // LETRA D..................    
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
  // LETRA R..................      
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
 // LETRA I..................      
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
    // LETRA G..................  
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
   // LETRA O..................   
    if(x7 != 490 && y7 != 200)
    {
      x7=int(random(0,800));
      y7=int(random(0,400));
      text(mi_nombre[6],x7,y7);
    }
  else
     {
       x7=490;
       y7=200;
       text(mi_nombre[6],x7,y7); 
     }
     
}

