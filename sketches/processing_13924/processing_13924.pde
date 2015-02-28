
class beam
{
  PVector position;
  float angle;
  float distance;
  float odistance = 0;
  float rotation = int( random( 4 ) ) * HALF_PI;
  beam( PVector position, float angle, float distance )
  {
    this.position = position;
    this.angle = angle;
    this.distance = distance;
    odistance = distance;
    beams = ( beam[] ) append( beams, this );
  }
  void run()
  {
    distance -= abs( distance ) > 0 ? ( distance / abs( distance ) * 6 ) : 0;
    if( distance <= 0 )
    {
      block made = new block( new PVector( position.x + cos( angle ) * distance, position.y - sin( angle ) * distance ) );
      made.rotation = rotation;
      for( int i = 0; i < beams.length; i++ )
      {
        if( beams[ i ] == this )
        {
          beam[] first = ( beam[] ) subset( beams, 0, i );
          beam[] second = ( beam[] ) subset( beams, i + 1 );
          beams = ( beam[] ) concat( first, second );
        }
      }
    }
    pushMatrix();
    tint( 255, ( 1 - distance / odistance ) * 255 );
    translate( position.x + cos( angle ) * distance, position.y - sin( angle ) * distance );
    rotate( -angle );
    scale( ( distance + 40 ) / 40, 1 );
    rotate( angle );
    rotate( rotation );
    image( box, -20, -20, 40, 40 );
    popMatrix();
    pushMatrix();
    translate( viewport.x, viewport.y );
    scale( 0.8, 0.8 );
    pushMatrix();
    translate( position.x + cos( angle ) * distance + 20 - viewport.x, position.y - sin( angle ) * distance + 40 - viewport.y );
    rotate( -angle );
    scale( distance / 40, 1 );
    rotate( angle );
    rotate( rotation );
    tint( 255, constrain( ( 1 - distance / odistance ) * 255 / 5, 0, 255 ) );
    image( box, -20, -20, 40, 40 );
    popMatrix();
    popMatrix();
    tint( 255 );
  }
}


