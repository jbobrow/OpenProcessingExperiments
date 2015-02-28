
class Node {
  PVector loc;
  PVector colour;
  
  public Node(float x, float y, float z) {
    this.loc = new PVector(x,y,z);
    this.colour = new PVector(random(155)+100, random(155)+100,
                              random(155)+100);
  }
}

