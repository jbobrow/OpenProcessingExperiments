
//Hernández Cruz Yanahui
//Lopez Lopez Ana Miriam
//Torres Torres Felipe Andrés

PFont tipo_letra;
char[] mi_nombre={'P','R','O','C','E','S','S','I','N','G'};
int x=1,y=2,x2=3,y2=4,x3=5,y3=6,x4=7,y4=8,x5=9,y5=10,x6=11,y6=12,x7=13,y7=14,x8=15,y8=16,x9=17,y9=18,x10=19,y10=20;

void setup()
{  
  size(800,400);   
}

void draw()
{
  background(0);//para limpiar
  tipo_letra=loadFont("AgencyFB-Reg-48.vlw");

  textFont(tipo_letra, 42);
  
  if(x != 220 && y != 200)
     {
        x=int(random(0,800));
        y=int(random(0,400));
        text(mi_nombre[0],x,y);
     }
  else
     {
         x=220;
         y=200;
         text(mi_nombre[0],x,y);  
     } 

  if(x2 != 250 && y2 != 200)
    {  
        x2=int(random(0,800));
        y2=int(random(0,400));
        text(mi_nombre[1],x2,y2); 
    }
  else
     {
       x2=250;
       y2=200;
       text(mi_nombre[1],x2,y2);  
     }
     
  if(x3 != 280 && y3 != 200)
    {  
      x3=int(random(0,800));
      y3=int(random(0,400));
      text(mi_nombre[2],x3,y3);
    }
  else
     {
       x3=280;
       y3=200;
      text(mi_nombre[2],x3,y3);  
     }
     
  if(x4 != 310 && y4 != 200)
    {
      x4=int(random(0,800));
      y4=int(random(0,400));
      text(mi_nombre[3],x4,y4);
    }
  else
    {
       x4=310;
       y4=200;
       text(mi_nombre[3],x4,y4); 
    }
    
  if(x5 != 340 && y5 != 200)
    {
      x5=int(random(0,800));
      y5=int(random(0,400));
      text(mi_nombre[4],x5,y5); 
    }
  else
     {
       x5=340;
       y5=200;
       text(mi_nombre[4],x5,y5);  
     }
   
   if(x6 != 370 && y6 != 200)
    {
      x6=int(random(0,800));
      y6=int(random(0,400));
      text(mi_nombre[5],x6,y6);
    }
  else
     {
       x6=370;
       y6=200;
       text(mi_nombre[5],x6,y6);  
     }  
     
  if(x7 != 400 && y7 != 200)
    {
      x7=int(random(0,800));
      y7=int(random(0,400));
      text(mi_nombre[6],x7,y7);
    }
  else
     {
       x7=400;
       y7=200;
       text(mi_nombre[6],x7,y7);  
     } 
     
  if(x8 != 435 && y8 != 200)
    {
      x8=int(random(0,800));
      y8=int(random(0,400));
      text(mi_nombre[7],x8,y8);
    }
  else
     {
       x8=435;
       y8=200;
       text(mi_nombre[7],x8,y8);  
     } 
  
   if(x9 != 455 && y9 != 200)
    {
      x9=int(random(0,800));
      y9=int(random(0,400));
      text(mi_nombre[8],x9,y9);
    }
  else
     {
       x9=455;
       y9=200;
       text(mi_nombre[8],x9,y9);  
     } 
     
 if(x10 != 487 && y10 != 200)
    {
      x10=int(random(0,800));
      y10=int(random(0,400));
      text(mi_nombre[9],x10,y10);
    }
  else
     {
       x10=487;
       y10=200;
       text(mi_nombre[9],x10,y10);  
     } 
}
