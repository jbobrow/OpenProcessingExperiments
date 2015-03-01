
//Zack Shen zixuans
//copyright?

final int NUM_RINGS, RING_WIDTH;
NUM_RINGS = 5;
RING_WIDTH = 50;
int xpos, ypos, diameter;

xpos = 60;
ypos = 60;

diameter = 280;

size(400,400);
fill(5, 255, 220);
rect(50,50,300,300,7);
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
  
  ellipse(xpos, ypos, diameter, diameter);
  
  xpos += RING_WIDTH/2;
  ypos += RING_WIDTH/2;
  
  diameter -= RING_WIDTH;
}



fill(250, 0 ,0);
arc(xpos, ypos, diameter, diameter, 0, radians(180));
arc(xpos, ypos, diameter, diameter, radians(180), radians(360));

fill(0, 0, 0);
stroke(4);
line(60, 200, 340, 200);
line(200, 60, 200, 340);

  


  



