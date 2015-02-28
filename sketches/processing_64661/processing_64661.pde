
public class TriNode
{
  public Triangle triangle;
  public float theta;
  public float speed;
  public float count;
  public int kolor;
  
  public TriNode(Triangle triangle)
  {
    this.triangle = triangle;
    theta = random(PI);
    speed = random(PI/24);
    count = 0;
    int val = int(random(255));
    kolor = color(val,val,val,180);
  }
}

