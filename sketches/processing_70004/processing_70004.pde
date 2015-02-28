
//Torres Torres Felipe Andrés
//Hernandez Cruz Yanahui
//Lopez Salinas Ana Miriam

PFont myFont;
char x=65, x2=97;
int y=2,y2=2;

void setup()
{
  size (1000,300);
}

void draw()
{
  if (x <=90)
  {
  myFont = loadFont("Jokerman-Regular-48.vlw");
  textFont(myFont);
  text(x, y, 50);
   x++;
   y+=35;
  }
 
 if(x > 90)
 {
 if (x2 <=122)
  {  
  myFont = loadFont("ComicSansMS-48.vlw");
  textFont(myFont);
  text(x2, y2, 100);
   x2++;
   y2+=30;
  }
 }
 
}

