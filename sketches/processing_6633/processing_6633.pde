
class Boid
{
  PVector position, offset;
  
  Boid()
  {
     position = new PVector();
     offset = new PVector();
     offset.x = random(0, width);
     offset.y = random(0, height);
     position.x = 0;
     position.y = 0;
  }
  
  void move()
  {
    offset.x = offset.x + 0.003;
    offset.y = offset.y + 0.005;
    position.x = noise(offset.x) * width;
    position.y = noise(offset.y) * height;
  }
  
  void update()
  {
    point(position.x, position.y);
  }
}

