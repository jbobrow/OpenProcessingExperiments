
class Rope {

  PVector anchor;
  ArrayList< RopeNode > nodes;

  public Rope( PVector anchor ) {
    this.anchor = anchor;
    nodes = new ArrayList< RopeNode >();
    nodes.add( new RopeNode( this.anchor ) );
    for ( int i = 0; i < 100; i++ )
      nodes.add( new RopeNode( nodes.get( i ).end ) );
  }
  
  public void update() {
  
    for ( RopeNode n : nodes )
      n.update();
  
  }
  
  public void draw() {
    
    strokeWeight( 1 );
    stroke( 0, 50 );
    
    beginShape( LINES );
    for ( RopeNode n : nodes ) {
      vertex( n.anchor.x, n.anchor.y );
      vertex( n.end.x, n.end.y );
    }
    endShape();
  }
  
  
}

