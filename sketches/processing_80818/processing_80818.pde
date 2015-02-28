
PFont may, min;
int i=65, j=97;
int x = 0;
void setup()
  {
     size(850, 400); 
     may=loadFont("Arial-Black-48.vlw");
     min=loadFont("Perpetua-BoldItalic-48.vlw");
     frameRate(10);
     smooth();
     background(#29088A);
  }

void draw()
  {
    if(i > 64  &&  i < 91)
      {
        x+= 30;
        textFont(may, 35);
        text(char(i), 10+x, 120);
        textFont(min, 40);
        text(char(j), 10+x, 300);
      }
    
    i+=1;
    j+=1;
   }


