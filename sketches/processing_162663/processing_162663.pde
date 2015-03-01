
void setup()
{
  size(1000,1000);
  background(255);
  frameRate(17);
}

void draw()
{
if (mousePressed)
{
  int hoitsu = 10;
  float xi = 0;
  float yi = 0;
  float xa = 0;
  float ya = 0; 
  while (hoitsu>0)
  {
    
  float wici = random(1,20);
  line(mouseX+xa,mouseY+ya,mouseX+xi,mouseY+yi);
  xa=xi;
  ya=yi;
    switch(frameCount%4)
    {
    case 0:xi=xi+wici;
    break;
    case 1:xi=xi-wici;
    break;
    case 2:yi=yi+wici;
    break;
    default:yi=yi-wici;
    break;  
    }
    hoitsu--;
   
  }
}
}
