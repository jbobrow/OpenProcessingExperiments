
class Node
{
  PMatrix3D transform;
  int geometry;
  Vector children;
  Node()
  {
    transform = new PMatrix3D();
    geometry = 0;
    children = new Vector();
  }
  void draw()
  {
    // note, a transform node affects all children,
    // while a geometry node just uses the transform to 
    // manipulate its own object
    if (geometry == 0) {
      applyMatrix(transform);
    }
    else {
      pushMatrix();
      applyMatrix(transform);
      switch (geometry) {
        case 1:
        box(2,2,2);
        break;
        case 2:
        sphere(1);
        break;
      }
      popMatrix();
    }
    for (int i = 0; i < children.size(); i++) {
      pushMatrix();
      Node n = (Node) children.get(i);
      n.draw();
      popMatrix();
    }
  }
}


