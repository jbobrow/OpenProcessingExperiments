
// This class describes the "Planet", the basic building block of the game

class Planet
{
  public int x;
  public int y;
  public int size;
  public float mass;
  public color planetColor;
  public int type; // Types: 0 = home, 1 = target, 2 = star, 3 = gas giant, 4 = conquered, 5 = other
  public int counter;
  public int direction;

  // Constructor
  Planet(int x, int y, int size, float mass, color planetColor, int type)
  {
    this.x = x;
    this.y = y;
    this.size = size;
    this.mass = mass;
    this.planetColor = planetColor;
    this.type = type;
    this.direction = 1;
  }

  void draw()
  {
    noStroke();
    fill(planetColor);
    if(type == 2 || type == 3)
    {
      for(int i = size; i > 0; i = i - size / 10)
      {
        fill(planetColor, 50);
        ellipse(x, y, (size + i) / 2, (size + i) / 2);
      }
    } else if (type != 4) {
      fill(planetColor, 128);
      ellipse(x, y, size * 1.1, size * 1.1);
      fill(planetColor);
      ellipse(x, y, size, size);
    }

    if(type == 1)
    {
      // If it's the target world, draw crosshairs on it
      for(int i = (int)(6 - 0.05 * counter); i > 0; i--)
      {
        shape(targetShape, x, y, (100 + 0.5 * counter) * size / 30, (100 + 0.5 * counter) * size / 30);
      }

      // direction flips at 80 and 0
      direction = (counter == 80)? -1 : (counter == 0)? 1 : direction;
      counter += direction;
    } else if (type == 4) {
      // Turn it from green to blue
      if(this.planetColor >= 0xFF0001FF)
      {
        this.planetColor = this.planetColor - #000200 + #000002;
      }
      shape(flagpole, (x + (counter * 0.2)), (y - (counter * 0.45)), (size * 0.66) + (counter * 0.1), (size * 0.66) + (counter * 0.1));
      ellipse(x, y, size, size);

      counter = (counter > 100)? counter : counter + 1;
      levelEnder++;
    }
  }
}

