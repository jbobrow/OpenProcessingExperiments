
class Edge{
  //Edge Class
  Vertex vStart; //start coordinate of edge
  Vertex vEnd; //end coordinate of edge
  Face fLeft; //left side face adjacent to edge
  Face fRight; //right side face adjacent to edge
  int index; //index of edges
  
  Edge (int i, Vertex start, Vertex end){
    //Edge Constructor
    //takes in index of edge, start Vertex, end Vertex
    index = i;
    vStart = start;
    vEnd = end;
    fLeft = null;
    fRight = null;
  }
  
  void draw(PVector[] coord) {
    //routine to draw edge
    stroke(255);
    PVector startPos = coord[vStart.index];
    PVector endPos = coord[vEnd.index];
    line(startPos.x, startPos.y, startPos.z, endPos.x, endPos.y, endPos.z);
  }
}

