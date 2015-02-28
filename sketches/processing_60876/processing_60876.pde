
//Generic node for the scenegraph. 
//Has a list of child nodes and one transformation relative to its parent
//I guess this is reinventing stuff already present in Processing, but I wanted to
//try on my own to implement a scene graph structure.

abstract class Node {
  Node [] children;
  PMatrix2D trf = new PMatrix2D(); 
  
  abstract void draw();
}

