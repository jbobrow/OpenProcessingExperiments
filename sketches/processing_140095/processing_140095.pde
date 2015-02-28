
void setup()
{
  size(800, 800);
  background(255);
  smooth();
}


void draw() 
{
  int NoOfLines = 50;
  int x = width/2;
  int y = height/2;
  int lineAngle = (int)random(360);
  int lineLength = 100;
  
  for (int i = 0; i < NoOfLines; i++) {

    newLine(x, y, lineAngle, lineLength);

  }  
  noLoop();  
}


void newLine(int x, int y, int lineAngle, int lineLength){

  int xx = (int)random(width);
  int yy = (int)random(height);

  
  
  line(x,y,xx,yy);
}
