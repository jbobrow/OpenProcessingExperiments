

public class Edge {
  float x1,y1,x2,y2;
  Node to;
  Node from;
  Graph g;
  String s, r;
  
  public Edge(Node f, Node t) {
    to = t;
    from = f;
    s = to.getLabel() + "->";
    r = "<-" + to.getLabel();
  }
  
  public void setGraph(Graph h) {
    g = h;
  }
    
  public Node getTo() {
    return to;
  }
  
  public Node getFrom() {
    return from;
  }
  
  public void setTo(Node n) {
    to = n;
  }
  
  public void setFrom(Node n) {
    from = n;
  }
  
  public float dX() {
    return to.getX() - from.getX();
  }
  
  public float dY() {
    return to.getY() - from.getY();
  }
  
    public void draw() {
      noFill();
      stroke(255,255,255,64);
      strokeWeight(3);
      x1 = from.position.x;
      y1 = from.position.y;
      x2 = to.position.x;
      y2 = to.position.y;
      float b,dx1,dx2;
      dx1 = Math.abs(x1 - x2)/3;
      dx2 = 2*dx1;
      b = y1 < y2 ? y2 + 100: y1 + 100;
      //line(x1,y1,x2,y2);
      //if(x1<x2)
        //bezier(x1,y1,x1+dx1,b,x1+dx2,b,x2,y2);    
      //else 
        //bezier(x1,y1,x2+dx2,b,x2+dx1,b,x2,y2);    
      smooth();
  }
}


