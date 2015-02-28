
class Node
{
  PVector pos;
  ArrayList links;
  
  Node(float inputX,float inputY)
  {
    pos = new PVector(inputX,inputY);
    links = new ArrayList();
  }
  
  void makeLink(Node other)
  {
    links.add(other);
  }
}

