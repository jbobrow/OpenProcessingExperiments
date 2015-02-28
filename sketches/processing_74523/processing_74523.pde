
// The aliens/boxes attack the Planet

class Alien
{
  private int startPos;                                        // Starting posiotn of the alien
  private int alienSize = 20;                                  // The size of the alien
  private float speed = int(random(1.5, 2.5));                 // Random speed of the Alien, used for difficulty when implemented
  private color[] alienColor = new color[4];                   // Alien Color
  private PVector position = new PVector(0,0,0);               // Position of the alien
  private PVector dir = new PVector(0,0,0);                    // dir of the alien
  private PVector planetPos = new PVector(0,0,0);              // Position of the planet
  private boolean isDead = false;

  Alien()
  {
    // Randomize a start position outisde screen.One of the four sides
    startPos = int(random(4));

    switch (startPos)
    {
    case 0:
      position.x =  0 - alienSize;
      position.y = int(random(alienSize*2, height-alienSize));
      break;
    case 1:
      position.x  = width + alienSize;
      position.y = int(random(alienSize*2, height-alienSize));
      break;
    case 2:
      position.x = int(random(alienSize*2, width-alienSize));
      position.y = 0 - alienSize;
      break;
    case 3:
      position.x = int(random(alienSize*2, width-alienSize));
      position.y = height + alienSize;
      break;
    }
    
    // Randomize color // psychadelic mode YEY!!!11
    alienColor[0] = color(126, 0, 255);
    alienColor[1] = color(0, 250, 219);
    alienColor[2] = color(250, 0, 96);
    alienColor[3] = color(250, 250, 0);
  }
  
  
  // Draws the alien and moves it to the planet
  void draw()
  {
    dir = PVector.sub(planetPos, position);
    dir.normalize();
    dir.mult(speed);

    position.add(dir);

    stroke(alienColor[int(random(3))]);
    rectMode(CENTER);
    rect(position.x, position.y, alienSize, alienSize);
  }
  
  // Gets position of Planet
  void setPlanetPos(PVector _endPos)
  {
    planetPos = _endPos;
  }

  // Getters
  int getSize()
  {
    return alienSize;
  }

  PVector getPos()
  {
    return position;
  }

  int getStartPos()
  {
    return startPos;
  }
  
  void isDead(boolean _killed)
  {
      if(_killed) isDead = true;
  }
}


