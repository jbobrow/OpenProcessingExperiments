
PFont Bradley;
int x=0, y=0, x1=0, y1=0, x2=0, y2=0, x3=0, y3=0;
char[] nombre = {'M', 'O', 'N', 'Y'};
 
void setup() 
{   
 size(400,400);
 frameRate(100);
 smooth(); 
 Bradley = loadFont("BrowalliaNew-48.vlw"); 
}
 
void draw()

{ 
background(0);
textFont(Bradley, 86);   
//M 
if( (x != 200) && (y != 200) )
{
  x = int(random(399));
  y = int(random(399));   
  text (nombre[0], x, y);
} 
else 
{
  text(nombre[0], 100, 200);
}
 
//O
if( (x1 != 200) && (y1 != 200) )
{
  x1 = int(random(399));
  y1 = int(random(399)); 
  text (nombre[1], x1, y1);
} 
else 
{
  text(nombre[1], 150, 200);
}
 
//N 
if( (x2 != 200) && (y2 != 200) ) 
{
  x2 = int(random(399));
  y2 = int(random(399));   
  text (nombre[2], x2, y2);
}
else
{
  text(nombre[2], 200, 200);
}
 
//Y
if( (x3 != 200) && (y3 != 200) ) 
{
  x3 = int(random(399));
  y3 = int(random(399));   
  text (nombre[3], x3, y3);
}
else
{
  text(nombre[3], 250, 200);
}
} // Cierra Draw


