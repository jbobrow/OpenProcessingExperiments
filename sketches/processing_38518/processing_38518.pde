
class Node
{
  PVector pos;
  Node parent;
  int weight;

  Node(float x, float y)
  {
    pos = new PVector(x, y);
    weight = 1;
  }

  Node(Node base, Node sample)
  {
    PVector step = PVector.sub(sample.pos, base.pos);
    step.limit(5.0);
    pos = PVector.add(base.pos, step);
    parent = base;
    weight = 1;
  }

  float dist(Node other)
  {
    return PVector.dist(pos, other.pos);
  }

  void draw()
  {
    if (parent == null)
      return;
    strokeWeight(1+log(weight)*0.5);  
    line(parent.pos.x, parent.pos.y, pos.x, pos.y);
  }
}


