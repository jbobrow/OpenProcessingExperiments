
Snail snail = new Snail(new PVector(mouseX, mouseY));

void setup()
{
  size(320, 240);
  background(255);
  strokeWeight(1);
  stroke (180);
}
void draw()
{
  PVector mouse = new PVector(random(height+30), mouseY);
  snail.move(mouse);
  snail.display();
  
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


