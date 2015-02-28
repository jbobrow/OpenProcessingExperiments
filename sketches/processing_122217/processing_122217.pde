

public static final int EDGE_LEFT =    0;
public static final int EDGE_RIGHT =   1;

class Edge {

  float length;
  
  Vertice pt1;
  Vertice pt2;
  Vertice middle;
  
  PVector normale;
  PVector left;
  PVector right;
  
  boolean connect_same_level;
  boolean belong_to_triangle;
  boolean optional;
  
  float level;
  
  int facescount;
  
  public Edge( Vertice pt1, Vertice pt2 ) {
    
    this.pt1 = pt1;
    this.pt2 = pt2;
    
    connect_same_level = false;
    if ( pt1.level == pt2.level ) {
      connect_same_level = true;
      level = pt1.level;
    } else {
      level = ( pt1.level + pt2.level ) * 0.5f;
    }
    belong_to_triangle = false;
    optional = false;
    facescount = 0;
    
    middle = new Vertice();
    middle.blend( pt1, pt2 );
    length = sqrt( pow( pt1.x - pt2.x, 2 ) + pow( pt1.y - pt2.y, 2 ) );
    
    normale = new PVector( pt2.x - pt1.x, pt2.y - pt1.y );
    normale.normalize();
    
    left = new PVector();
    left.x = normale.y;
    left.y = -normale.x;
    
    right = new PVector();
    right.x = -left.x;
    right.y = -left.y;
    
  }
  
  public Vertice getOther( Vertice pt ) {
    if ( pt == pt1 )
      return pt2;
    if ( pt == pt2 )
      return pt1;
    return null;
  }
  
  public boolean connectedTo( Vertice pt ) {
    if ( this.pt1 == pt || this.pt2 == pt )      return true;
    return false;
  }
  
  public boolean connectedTo( Vertice pt1, Vertice pt2 ) {
    if ( isMyPoint( pt1, pt2 ) ) {
      // System.err.println( "both points belongs to this edge!!!" );
      return false;
    }
    if ( this.pt1 == pt1 || this.pt1 == pt2 || this.pt2 == pt2 || this.pt2 == pt1 )
      return true;
    return false;
  }
  
  public boolean isMyPoint( Vertice pt1, Vertice pt2 ) {
    if ( this.pt1 == pt1 && this.pt2 == pt2 )
      return true;
    if ( this.pt1 == pt2 && this.pt2 == pt1 )
      return true;
    return false;
  }

}

