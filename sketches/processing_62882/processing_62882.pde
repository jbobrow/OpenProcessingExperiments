
public class Node
{
  private PVector current;
  private PVector next;
  private PVector diff;
  private int Kolor;
  
  public Node()
  {
    current = new PVector(250.f,250.f);
    next = new PVector(random(width), random(height));
    diff = new PVector(0,0,0);
    float diffx = next.x - current.x;
    float diffy = next.y - current.y;
    diff.set(diffx,diffy,0);
    diff.normalize();
    diff.mult(2);
    Kolor = color(int(random(255)),int(random(255)),int(random(255)),150); 
  }
  
  public void display()
  {
    strokeWeight(2);
    stroke(Kolor);
    point(current.x,current.y);
    if(abs(current.x - next.x) > 5 ||
    abs(current.y - next.y) > 5) {
    current.x += diff.x;
    current.y += diff.y;
    }
    else {
    next = new PVector(random(width), random(height));
    float diffx = next.x - current.x;
    float diffy = next.y - current.y;
    diff.set(diffx,diffy,0);
    diff.normalize();
    Kolor = color(int(random(255)),int(random(255)),int(random(255)),150); 
    //diff.mult(5);
    ellipse(current.x,current.y,10,10);
  }
  }
  
  public void setCurrent()
  {
    current.x = random(width);
    current.y = random(height);
    next = new PVector(random(width), random(height));
    float diffx = next.x - current.x;
    float diffy = next.y - current.y;
    diff.set(diffx,diffy,0);
    diff.normalize();
    Kolor = color(int(random(255)),int(random(255)),int(random(255)),150); 
    diff.mult(2);
  }
  
  public void setNext()
  {
    next.x = mouseX;
    next.y = mouseY;
    float diffx = next.x - current.x;
    float diffy = next.y - current.y;
    diff.set(diffx,diffy,0);
    diff.normalize();
    diff.mult(2);
  }
};
  

