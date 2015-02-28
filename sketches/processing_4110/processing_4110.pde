
class Node
{
  String string;
  PVector position;
  
  Node left, right;

  // nodes are only made when there is a new character
  Node(char s)
  {
    left=null;
    right=null;
    string=Character.toString(s); // convert keyboard character to string
    position=null;
  }
  
  int compareTo(Node currentNode)
  {
    // get comparision of the two strings using the java string class compareTo
    // not to be confused with the function we're in right now.
    return string.compareTo(currentNode.string);
  }
}


