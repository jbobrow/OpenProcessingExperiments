
//asteroid stuff
//Max amt of asteroids in 300px
int maxAsteroidCount = 6;
ArrayList<Asteroids> asteroids = new ArrayList<Asteroids>();

//"dead" asteroid arraylist
ArrayList<Asteroids> deadAsteroids = new ArrayList<Asteroids>();


public class Asteroids
{
  int x, y, size;

  Asteroids(int ix, int iy, int isize) 
  {
    x = ix;
    y = iy;
    size = isize;
  }

  void draw() 
  {
    fill(255);
    image(asteroidAnimation, x, y, size, size);
//    ellipse(x, y, size, size);
  }
}


void generateAsteroids()
{
  if (frameCount%120 == 0)
  {
    for (int i=0; i<maxAsteroidCount/2; i++) 
    {
      float higherBound = earth.y - height - scrollAmount;
      float lowerBound = earth.y - (height*2) - scrollAmount;
      //   println("Bounds: " + lowerBound + ", " + higherBound + ": Difference of " + (lowerBound-higherBound));
      float randomY = random(lowerBound, higherBound);
      //    println("******************* " + randomY);
      asteroids.add(new Asteroids((int)random(width), (int)randomY, (int)random(40, 60)));
    }
  }
}

void removeOffscreenAsteroids()
{
  int counter = 0;
  while (counter < asteroids.size ())
  {
    if (asteroids.get(counter).y > -(scrollAmount - height - 50))
    {
      deadAsteroids.add(asteroids.get(counter));
      counter--;
      // println ("removed asteroid");
    }
    asteroids.removeAll(deadAsteroids);
    counter++;
  }
}


