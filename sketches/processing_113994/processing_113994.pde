
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
  
  int squareSize = 25;
  int squareDistance = 20;
  
  for (int x=10; x<width; x=x+squareDistance) {
    for (int y=1; y<=height; y=y+squareDistance) {
      for (int i=13; i<mouseX; i=i*squareDistance)
  {
      stroke(random(255));
      posX = x + random(mouseX/5);
      posY = y + random(mouseX/50);
      
      
      
      
    posZ = i + height;
    posQ = i - width;
    
    ellipse(posX, posY, posQ, posZ);
    
    rect(posX, posY, 10, 10);
    
    }
  }
  
   
  }
}
