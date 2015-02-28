
class Particule {

  public PVector position;
  public PVector direction;
  public float content;
  
  public Particule() {
    
    // appears on borders only!
    float x = 0;
    float y = 0;
    int r = (int) random( 0,4 );
    switch( r ) {
      case 0:
        y = random( 0,1 );
        break;
      case 1:
        x = 1;
        y = random( 0,1 );
        break;
      case 2:
        x = random( 0,1 );
        break;
      case 3:
        y = 1;
        x = random( 0,1 );
        break;
    }
    position = new PVector( x * width, y * height );
    direction = new PVector( random( -1,1 ), random( -1,1 ) );
    direction.normalize();
    content = random( 0.3f, 1 );
    if ( random( 0, 1 ) > 0.5f )
      content *= -1;
  
  }
  
  public void update() {
    position.add( direction );
  }
  
  public void draw() {
  
    noFill();
    stroke( 255 );
    if ( content < 0 )
      stroke( 0 );
    ellipse( position.x, position.y, content * 5, content * 5 );
    
  
  }
  
}

