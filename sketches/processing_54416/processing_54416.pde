
class Fibre{
  
  ArrayList<Node> nodes;
  
//--------------------------------------constructor
  Fibre(){
    nodes = new ArrayList<Node>();
  }
  
  
//--------------------------------------setters and getters
  void addNode(Node n){
    nodes.add(n);
  }
  
  void update(){
    noFill();
    beginShape();
    for (Node n:nodes){
      n.run();
      curveVertex(n.loc.x,n.loc.y,n.loc.z);
    }
    endShape();
  }
}

