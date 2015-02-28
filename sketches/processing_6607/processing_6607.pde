
ArrayList Boids;
int bNum = 100;

void setup()
{
 size(500, 500);
 fill(255, 255, 255); 
 Boids = new ArrayList();
 for(int i = 0; i < bNum; i++)
 {
   Boids.add(new Boid());
 }
 stroke(255, 4);
 background(67, 66, 66);
}

void draw()
{
  for(int i = Boids.size()-1; i >= 0; i--)
  {
    Boid boid = (Boid) Boids.get(i);
    boid.move();
    boid.update();
  } 
}

class Boid
{
//  float offset.position.x, position.y, off, offset.y;
  PVector position, offset;
  
  Boid()
  {
     position = new PVector();
     offset = new PVector();
     offset.x = random(0.1, 0.7);
     // trposition.y replacing 0.1 with random(0.2, 0.5)
     offset.y = random(0.1, 0.4);
     position.x = 0;
     position.y = 0;
  }
  
  void move()
  {
    offset.x = offset.x + 0.005;
    offset.y = offset.y + 0.005;
    position.x = noise(offset.x) * width;
    position.y = noise(offset.y) * height;
  }
  
  void update()
  {
    point(position.x, position.y);
  }
}
   

