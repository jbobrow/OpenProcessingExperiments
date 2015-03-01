
//Zack Shen zixuans
//copyright?

final int NUM_RINGS = 5, RING_WIDTH = 50, BOARD_HEIGHT = 400, BOARD_WIDTH = 400;

int xposRect = 50, yposRect = 50, rectHeight = 300, rectWidth = 300;

int xposCirc = 60, yposCirc = 60, diameter = 280;

size(400, 400);
fill(5, 255, 220);
rect(xposRect,yposRect,rectWidth,rectHeight);
fill(20, 5, 255); 

ellipseMode(CORNER);

for (int i = 0; i < NUM_RINGS; i++)
{
  if(i%2 == 0)
  {
    fill(233,255,5);
  }
  else
  {
    fill(20, 5, 255); 
  }
  
  ellipse(xposCirc, yposCirc, diameter, diameter);
  
  xposCirc += RING_WIDTH/2;
  yposCirc += RING_WIDTH/2;
  
  diameter -= RING_WIDTH;
}



fill(250, 0 ,0);
arc(xposCirc, yposCirc, 30, 30, 0, radians(180));
arc(xposCirc, yposCirc, 30, 30, radians(180), radians(360));

fill(0, 0, 0);

stroke(4);

line(60, 200, 340, 200);
line(200, 60, 200, 340);


  


  



