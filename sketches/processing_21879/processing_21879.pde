
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
      made.user = ! dev;
      made.rotation = rotation;
      destroy();
    }
  }
  void show()
  {
    shading.pushMatrix();
    shading.tint( 255, ( 1 - distance / odistance ) * 255 );
    shading.translate( position.x + cos( angle ) * distance, position.y - sin( angle ) * distance );
    shading.rotate( -angle );
    shading.scale( ( distance + BLOCK_WIDTH ) / BLOCK_WIDTH, 1 );
    shading.rotate( angle );
    shading.rotate( rotation );
    //image( box, -23, -23, 46, 46 );
    shading.fill( 255, ( 1 - distance / odistance ) * 255 );
    shading.rect( -BLOCK_WIDTH / 2, -BLOCK_HEIGHT / 2, BLOCK_WIDTH, BLOCK_HEIGHT );
    shading.tint( 255 );
    shading.popMatrix();
  }
  void destroy()
  {
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
}


