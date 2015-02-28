
class BombOrb extends RandomStuffs
{
  float pulse;
  boolean removeThis = false;
  BombOrb(float x, float y)
  {
    super(x,y, 50, 255, 75, 18);
  }
  
  void affects()
  {
    numberOfBombs++;
    removeThis = true;
  }
  
  void display()
  {
    if(!pacmanMode)
    {
    stroke(r, g, b, constrain(25*abs(sin(pulse) + 1), 5, 50));
    fill(r, g, b);
    ellipse(x, y, orbSize, orbSize); 
    }
  }
  
  void update()
  {
    pulse += .05;
  }
  
  boolean remove()
  {
    return removeThis;
  }
  
  
  
}

