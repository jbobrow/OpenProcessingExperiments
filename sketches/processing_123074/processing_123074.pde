
Snail snail = new Snail(new PVector(mouseX, mouseY));
int numberOfSnails = 100;
Snail [] snails = new Snail[numberOfSnails];

void setup()
{
  size(320, 240);
  background(255);
  strokeWeight(1);
  stroke (2);
  
    for(int i = 30; i < numberOfSnails; i++)
 {
   snails[i] = new Snail(new PVector(random(height), mouseY));
 }
  
}
void draw()
{
  PVector mouse = new PVector(random(width), mouseX);
  snail.move(mouse);
  snail.display();
  
    for(int i = 30; i < numberOfSnails; i++)
  {
    snails[i].move(mouse);
    snails[i].display();
  }
  
}
class Snail
{
  PVector previousPosition;
  PVector position;
  PVector velocity;
  Snail(PVector startingPosition)
  {
    position = startingPosition;
    velocity = new PVector(5, 5);
  }
  
  void display()
  {
    line(previousPosition.x, previousPosition.y, position.x, position.y);
  }
  
  void move(PVector point)
  {
    previousPosition = position.get();
    if(mousePressed)
    {
      PVector v = PVector.sub(point, position);
      v.normalize();
      v.mult(.5);
      
      velocity.add(v);
      velocity.limit(5);
      
    } 
    position.add(velocity);
  }
}


