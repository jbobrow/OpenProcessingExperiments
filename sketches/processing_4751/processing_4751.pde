
public class Element
{
  boolean attachedToMolecule = false;
  Molecule moleculeAttachedTo;
  int type;
  PVector position;
  PVector speed = new PVector(0,0);
  float radius = 3;
  
  public Element(int _type, PVector _position)
  {
    type = _type;
    position = _position;
  }
  
  public Element(int _type, PVector _position, PVector _speed)
  {
    type = _type;
    position = _position;
    speed = _speed;
  }
  
  public Element(int _type, float x, float y)
  {
    type = _type;
    position = new PVector(x,y);
  }
  
  
  
  public void update()
  {
    if(!attachedToMolecule)
    {
      position.x += speed.x;
      position.y += speed.y;
      if(position.x < radius)
        speed.x = abs(speed.x);
      else if(position.x > width-radius)
        speed.x = -abs(speed.x);
      if(position.y < radius)
        speed.y = abs(speed.y);
      else if(position.y > height-radius)
        speed.y = -abs(speed.y);
    }
  }
  
  public void draw()
  {
    noStroke();
    fill(type,(type*3)%4,(type*5)%4);
    ellipse(position.x, position.y, radius*2, radius*2);
  }
}

