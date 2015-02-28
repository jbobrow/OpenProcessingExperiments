
//ROWAN CASSIUS, CP1, B7
//Variables
int r1 = 0;
int r2 = 0;
int r3 = 0;
int q = 0;
int backg = 225;
int stkwt = 3;
boolean qyes = false;
boolean ckey = true;
void setup()
{ 
 
  size(500,500);
  background(backg);
  
}
void draw()
{
  
}
void mouseDragged()
{    
  fill(225,0,0);
  stroke(r1,r2,r3); 
  strokeWeight(stkwt);
  line(mouseX,mouseY,pmouseX,pmouseY);
  if(qyes == true)
  {
  line(500-mouseX,mouseY,500-pmouseX,pmouseY);
  }
}
void keyPressed()
{  
  //COLORS
  //red
  if (key == 'r')
  {
    r1 = 225; 
    r2 = 0;
    r3 = 0;
  }
  //green
  if (key == 'g')
  {
    r1 = 0;
    r2 = 225;
    r3 = 0;
  }
  //blue
   if (key == 'b')
  {
    r1 = 0;
    r2 = 0;
    r3 = 225;
  }
  //yellow
   if (key == 'y')
  {
    r1 = 241;
    r2 = 255;
    r3 = 49;
  }
  //black
   if (key == 'l')
  {
    r1 = 0;
    r2 = 0;
    r3 = 0;
  }
  //orange
   if (key == 'o')
  {
    r1 = 240;
    r2 = 139;
    r3 = 15;
  }
  //pink
  if (key == 'p')
  {
    r1 = 247;
    r2 = 102;
    r3 = 131;
  }
  //purple
  if (key == 'u')
  {
    r1 = 170;
    r2 = 102;
    r3 = 219;
  }
  //teal
  if (key == 't')
  {
    r1 = 102;
    r2 = 219;
    r3 = 198;
  }
  //white/eraser
   if (key == 'w')
  {
    r1 = 225;
    r2 = 225;
    r3 = 225;
  }
  //FUNCTIONS
  //draw in symmetry
  if(key == 'q' )
  {
    qyes = !qyes;
    println(q + ", " + qyes);
  }
  //increase line width
  if(key == '+')
  {
    stkwt++;
  }
  //decrease line width
  if(key == '-' && stkwt > 0)
  {
    stkwt--;
  }
 
}
void mousePressed()
{
  //clear screen
  if (mouseButton == RIGHT)
  {
    background(225);
  }
}
