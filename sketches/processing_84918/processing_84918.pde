
import java.util.ArrayList;
ArrayList<Ghost> ghosts;

void setup()
{
  
  size(400,400);
  noStroke();
  
  ghosts = new ArrayList<Ghost>();
}
 
void draw()
{
  background(0);
  Ghost ghost;
  for(int i = 0; i<ghosts.size(); i++)
  {
     ghost = ghosts.get(i);
     ghost.draw();
  }   
}

void mousePressed()
{
    ghosts.add(new Ghost(int(random(0,10)),int(random(0,10)),int(random(0,10)),
       mouseX, mouseY, int(random(5,10)), 400, 400, int(random(1,5))));
}

class Ghost
{
  int r, g, b, speed, xSize, ySize, size;
  boolean left = true, up = true;
  int[] px = new int[20];
  int[] py = new int[20];
  
  Ghost(int red, int green, int blue, 
    int x, int y, int maxSpeed, int xBound, int yBound, int sizeMod)
  {
    r = red;
    g = green;
    b = blue;
    px[0] = x;
    py[0] = y;
    speed = maxSpeed;
    xSize = xBound;
    ySize = yBound;
    size = sizeMod;
  }
      
  void draw()
  {
    // X bounding and movement
    if(px[0]-size<0)
    {
      px[0]=size;
      left = false;
    }
    else if(px[0]+size>xSize)
    {
      px[0]=xSize-size;
      left = true;
    }
    if(left)
    {
      px[0] = px[0]+int(random(-speed,-1));
    }
    else
    {
      px[0] = px[0]+int(random(1,speed));
    }
    // Y bounding and movement
    if(py[0]<0)
    {
      py[0]=size;
      up = false;
    }
    else if(py[0]>ySize)
    {
      py[0]=ySize-size;
      up = true;
    }
    if(up)
    {
      py[0] = py[0]+int(random(-speed,-1));
    }
    else
    {
      py[0] = py[0]+int(random(1,speed));
    }
    
    // random colors
    for(int i=0; i<19; i++)
    {
      fill((19-i)*r,(19-i)*g,(19-i)*b,100);
      ellipse(px[i],py[i],(19+size-i)*size,(19+size-i)*size);
    }
    // position update for non-lead circle
    for(int i=0; i<19; i++)
    {
      px[(19-i)]=px[(18-i)];
      py[(19-i)]=py[(18-i)];
    }
  }
}




