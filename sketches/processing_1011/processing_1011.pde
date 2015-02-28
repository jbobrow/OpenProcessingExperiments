
class Game
{
  Grid grid;
  Planet[] planets;
  
  Game(int gridWidth, int gridHeight, int numPlanets)
  {
    noFill();
    strokeWeight(2);
    stroke(color(0, 128, 0));
    
    grid = new Grid(gridWidth, gridHeight);
    planets = new Planet[numPlanets];
    for (int i = 0; i < planets.length; i++)
    {
      planets[i] = new Planet(int(random(width)), int(random(height)), int(random(5, 20)));
    }
  }
  
  void update()
  {
    //Gravitate planets toward each other
    for (int i = 0; i < planets.length - 1; i++)
    {
      for (int j = i + 1; j < planets.length; j++)
      {
        planets[i].gravitate(planets[j]);
      }
    }
    
    //Update positions
    for (int i = 0; i < planets.length; i++)
    {
      planets[i].updatePosition();
      planets[i].wrap();
    }
    
    grid.update(planets);
  }
  
  void draw()
  {
    grid.draw();
    for (int i = 0; i < planets.length; i++)
    {
      planets[i].draw();
    }
  }
}

