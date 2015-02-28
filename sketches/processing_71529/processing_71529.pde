

 
void setup()
{
  size (1000,300);
  background(0);
}
 
char x1=65, x2=97;
int y1=2,y2=2;  
PFont myFont;
 
void draw()
{
  if (x1 <=90)
  {
  myFont = loadFont("AgencyFB-Reg-48.vlw");
  textFont(myFont);
  text(x1, y1, 80);
   x1++;
   y1+=35;
  }
  
 if(x1 > 90)
 {
 if (x2 <=122)
  { 
     
  myFont = loadFont("BatangChe-48.vlw");
  textFont(myFont);
  text(x2, y2, 180);
   x2++;
   y2+=30;
  }
 }
  
}

