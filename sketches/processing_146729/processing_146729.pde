
// Stephanie Jeong yujeongj copyright 2014
// hw 10

String [] dataStrings1;
 
float x,y;
float dx,dy;
 
void setup()
{
  size(600,400);
  textSize(16.5);
  textAlign(LEFT);
   
  dataStrings1 = loadStrings("text.txt");

   
  x=20;
  y=120;
  dx=1;
  dy=1;
}
 
void draw()
{
  background(255,240,245);
  printQuotes();
  moveQuotes();
}
 
void printQuotes()
{
  for(int i = 0; i < dataStrings1.length; i++)
  {
    fill(0);
    text(dataStrings1 [i], x, y-120);
  }

}
 
void moveQuotes()
{
  y += dy;
  if(y > height)
  {
    dy -= 1;
  }
  else if(y < 120)
  {
    dy += 1;
  }
}
   
void keyPressed()
{
  exit();
}



