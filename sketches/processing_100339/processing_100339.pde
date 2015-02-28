
class MapTraveller {

  public static final float MT_SPEED = 5;
  public static final float MT_DEVIATION = 0.2f;
  
  PVector direction;
  float[][] positions;
  
  public MapTraveller( float x, float y, float z, int history ) {
    positions = new float[ history ][ 3 ];
    for ( int i=0; i < positions.length; i++ ) {
      positions[ i ][ 0 ] = x;
      positions[ i ][ 1 ] = y;
      positions[ i ][ 2 ] = z;
    }
    direction = new PVector();
    direction.x = random( -1, 1 );
    direction.y = random( -1, 1 );
    direction.normalize();
    direction.mult( MT_SPEED );
  }
  
  public float getZPositionOnMap( float x, float y ) {
    // closest mappoint
    int closest = -1;
    float smallest = -1;
    for ( int i=0; i < mapfaces.length; i++ ) {
      float d = mapfaces[ i ].dist( x, y );
      if ( closest == -1 || smallest > d ) {
        closest = i;
        smallest = d;
      }
    }
//    int col = (int) ( x / mapwidth );
//    int row = (int) ( y / mapheight );
//    int cc = col + ( row * mapwidth );
//    println( "found via loop: " + closest + " ==? " + cc );
    return mapfaces[ closest ].getZprojection( x, y );
  }
  
  public void update() {
    
    for ( int i = positions.length-1; i > 0; i-- ) {
      positions[ i ][ 0 ] = positions[ i-1 ][ 0 ];
      positions[ i ][ 1 ] = positions[ i-1 ][ 1 ];
      positions[ i ][ 2 ] = positions[ i-1 ][ 2 ];
    }
    positions[ 0 ][ 0 ] += direction.x;
    positions[ 0 ][ 1 ] += direction.y;
    positions[ 0 ][ 2 ] = getZPositionOnMap( positions[ 0 ][ 0 ], positions[ 0 ][ 1 ] );
    if ( positions[ 0 ][ 0 ] < 0 )
      positions[ 0 ][ 0 ] = 0;
    if ( positions[ 0 ][ 0 ] > levels.width )
      positions[ 0 ][ 0 ] = levels.width;
    if ( positions[ 0 ][ 1 ] < 0 )
      positions[ 0 ][ 1 ] = 0;
    if ( positions[ 0 ][ 1 ] > levels.height )
      positions[ 0 ][ 1 ] = levels.height;
    if ( positions[ 0 ][ 0 ] + direction.x < 0 || positions[ 0 ][ 0 ] + direction.x > levels.width )
      direction.x *= -1;
    if ( positions[ 0 ][ 1 ] + direction.y < 0 || positions[ 0 ][ 1 ] + direction.y > levels.height )
      direction.y *= -1;
    
    direction.x += random( -MT_DEVIATION, MT_DEVIATION );
    direction.y += random( -MT_DEVIATION, MT_DEVIATION );
    direction.normalize();
    direction.mult( MT_SPEED );
    
  }

}


