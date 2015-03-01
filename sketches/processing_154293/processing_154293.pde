
//Zack Shen zixuans
//copyright?

final int RING_WIDTH = 50;
int rectHeight = 300, rectWidth = 300;
int  diameter = 280;

void setup()
{
  size(400,400);
}
  
void draw()
{  
  background (0, 0, 0);
  float x = mouseX;
  float y = mouseY;
  float objWidth = (x/200)*y;
  float objHeight = y + 10;
  
  fill(5, 255, 220);
  rect(x - rectWidth/2, y - rectHeight/2, objWidth, objHeight);
  
  fill(20, 5, 255); 
  ellipseMode(CORNER);
  ellipse(x - diameter/2, y - diameter/2, objWidth, objHeight);
 
  fill(233,255,5); 
  ellipse(x - (diameter - RING_WIDTH)/2, y - (diameter - RING_WIDTH)/2, objWidth - RING_WIDTH, objHeight - RING_WIDTH);
  
  fill(20, 5, 255);
  ellipse(x - (diameter - RING_WIDTH*2)/2, y - (diameter - RING_WIDTH*2)/2, objWidth - RING_WIDTH*2, objHeight - RING_WIDTH*2);
  
  fill(233,255,5);
  ellipse(x - (diameter - RING_WIDTH*3)/2, y - (diameter - RING_WIDTH*3)/2, objWidth - RING_WIDTH*3, objHeight - RING_WIDTH*3);
  
  fill(20, 5, 255);
  ellipse(x - (diameter - RING_WIDTH*4)/2, y - (diameter - RING_WIDTH*4)/2, objWidth - RING_WIDTH*4, objHeight - RING_WIDTH*4);
  
  
  fill(250, 0 ,0);
  arc(x - 30/2, y - 30/2, objWidth - RING_WIDTH*5 , objHeight - RING_WIDTH*5, 0, radians(180));
  arc(x- 30/2, y - 30/2, objWidth - RING_WIDTH*5 , objHeight - RING_WIDTH*5, radians(180), radians(360));
  
  fill(0, 0, 0);
  stroke(4);
  line(objWidth - 60, y, objWidth + 60, y);
  line(x, objHeight - 60, x, objHeight + 60);
}
    
  
  


  


  



