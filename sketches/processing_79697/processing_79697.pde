
int x = 0;
int y = 0;
int endX = 0;
int endY = 0;
 
void setup() {
  size(500, 500);
  frameRate(10);
  noFill();
  
}
 
void draw() 
{
  background(255);
  
  //horizontal
  for (int y = 0; y < endY; y+=10) 
  {
    stroke(0, 100);
    line(0, y, width, y); 
  }
 
  //vertical
  for (int x = 0; x < endX; x+=10) {
    stroke(0, 100);
    line(x, 0, x, height);
  }
 
  endX += 10;
  endY += 10;


  if (mousePressed) 
  {
    endX = 0;
    endY = 0;
    
  }
}
