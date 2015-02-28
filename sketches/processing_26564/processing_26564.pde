
class Join {
  Node n1;
  Node n2;
  
  Join (Node pn1, Node pn2) {
    n1 = pn1;
    n2 = pn2; 
  }

  boolean hasNodes (Node an1, Node an2) {
    if (an1 == n1 && an2 == n2 || an1 == n2 && an2 == n1) return true;    
    return false;
  }  
  
  @Override public String toString() {
    return "Connection Between " + n1.toString() + " and " + n2.toString() + "."; 
  }
}


