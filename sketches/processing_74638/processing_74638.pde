
// AlanC
//14/15ComputerProgrammingClass
//http://alansprogrammingsite.webs.com/


void setup()
{
  size(600, 600);
  background(180);
  smooth();
  frameRate(15);
}
void draw()
{
  int numrects = 1;
  background(180);
 
  while (numrects <= 100)
  {
    numrects++;
    fill(random(205), random (55), random (155),140);
    rect(int(random(600)), int(random(600)),50,50);
    
  }
}
