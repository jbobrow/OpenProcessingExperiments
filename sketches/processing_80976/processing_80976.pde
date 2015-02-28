
PFont myFont;
char x=65, x2=97;
int y=2,y2=2;
 
void setup()
{
  size (900,300);
 
}
 
void draw()
{
  
  background(124,42,105);
  if (x <=90)
  {
  myFont = loadFont("Desdemona-48.vlw");
  textFont(myFont);
  text(x, y, 50);
   x++;
   y+=35;
   println(myFont);
  }
  
 if(x > 90)
 {
 if (x2 <=122)
  { 
     
  myFont = loadFont("Desdemona-48.vlw");
  textFont(myFont);
  text(x2, y2, 100);
   x2++;
   y2+=30;
  }
 }
  
}


