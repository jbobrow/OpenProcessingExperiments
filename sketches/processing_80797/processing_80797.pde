
PFont tipo_letra;
int x0=0, y0=0, x1=0, y1=0, x2=0, y2=0, x3=0, y3=0, x4=0, y4=0, x5=0, y5=0, x6=0,y6=0;
char[] miNombre={ 'G' , 'e' , 'r' , 'a' , 'r', 'd', 'o'};

void setup() 
  {
    size (800,400);
    frameRate (50);
    tipo_letra = loadFont ("SansSerif.italic-48.vlw");
  }


void draw() 
  {
    background (0);
    textFont (tipo_letra, 86);
  
    if(( x0 != 200) && (y0 != 200))
     {
        x0 = int ( random (699));
        y0 = int ( random (399));
        text (miNombre [0], x0, y0);
      }
    else 
      {
        text (miNombre [0], 190,200);
      }
 
    if ((x1 != 250) && (y1 != 200)) 
      {
        x1 = int ( random (699));
        y1 = int ( random (399));
        text (miNombre [1], x1, y1);
      }
    else 
      {
        text (miNombre [1], 250,200);
       }
 
    if ((x2 != 300) && (y2 != 200))
      {
        x2 = int ( random (699));
        y2 = int ( random (399));
        text (miNombre [2], x2, y2);
      }
    else 
      {
        text (miNombre [2], 290, 200);
      }
 
    if ((x3 != 350) && (y3 != 200)) 
      {
        x3 = int ( random (699));
        y3 = int ( random (399));
        text (miNombre [3], x3, y3);
      }
    else 
      {
        text (miNombre [3], 315,200);
      }
 
    if ((x4 != 400) && (y4 != 200)) 
      {
        x4 = int ( random (699));
        y4 = int ( random (399));
        text (miNombre [4], x4, y4);
      }
    else 
      {
        text (miNombre [4], 355, 200);
      }
    if ((x5 != 450) && (y5 != 200)) 
      {
        x5 = int ( random (699));
        y5 = int ( random (399));
        text (miNombre [5], x5, y5);
      }
    else 
      {
        text (miNombre [5], 380, 200);
      }
    if ((x6 != 500) && (y6 != 200)) 
      {
        x6 = int ( random (699));
        y6 = int ( random (399));
        text (miNombre [6], x6, y6);
      }
    else 
      {
        text (miNombre [6], 420, 200);
      }
  }



