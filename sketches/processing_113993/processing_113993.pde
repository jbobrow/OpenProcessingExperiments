
//Christian Murphy
//October 2013
void setup()
{
size(380, 800);
smooth();
noFill();
} 

int rows = 12;
int columns = 25;
int side = 30;

//1. draw a line of squares
void draw()
{
  background(250, random(255), random(255));
  
  float posX;
  float posY;
  float posZ;
  float posQ;
