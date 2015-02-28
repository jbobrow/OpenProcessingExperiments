
DuduHead dudu;

void setup()
{
  size(640, 480);
  smooth();
  frameRate(60);
  noStroke();
  fill(255);
  dudu = new DuduHead(width>>1, height>>1);
  for (int i = 0; i <100;i++)
  {
    dudu.addBodyPart();
  }
}
void draw()
{
  background(0);
  dudu.update();
  dudu.draw();
}
 
class DuduBodyPart
{
  float x,y;
  DuduBodyPart previous = null;
  void addBodyPart()
  {
    if (previous == null)
    {
      previous = new DuduBodyPart();
    }
    else
    {
      previous.addBodyPart();
    }
  }
  void newCoordinates(float x, float y)
  {
    if (previous != null)
    {
      previous.newCoordinates(this.x,this.y);
    }
    this.x = x;
    this.y =y ;
  }
  void draw()
  {
    if (previous != null)
      previous.draw();
    ellipse(x,y,5,5);
  }
}

class DuduHead
{
  float x,y;
  float offset = 0;
  float offset_increment = 0.05;
  float speed = 3;
  float angle = 0;
  DuduBodyPart previous = null;
 
  DuduHead(float x, float y)
  {
    this.x = x;
     this.y = y;
  }
 
  void update()
  {
    if (previous != null)
    {
      previous.newCoordinates(x,y);
    }
    offset += offset_increment;
    angle = map(noise(offset),0,1,0,TWO_PI);
    x += cos(angle) * speed;
    y += sin(angle) * speed;
   
    if (x < 0) x += width;
    if (x >= width) x -= width;
    if (y < 0) y += height;
    if (y >= height) y -= height;
  }
 
  void addBodyPart()
  {
    if (previous == null)
    {
      previous = new DuduBodyPart();
    }
    else
    {
      previous.addBodyPart();
    }
    update();
  }
 
  void draw()
  {
    if (previous != null)
      previous.draw();
    ellipse(x,y,10,10);
  }
}


