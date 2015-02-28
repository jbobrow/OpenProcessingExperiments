
final int BLOB_COUNT = 512;
final float WIDTH    = 480.0;
final float HEIGHT   = 480.0;

final int NEW_GAME       = 0;
final int GAME_OVER      = 1;
final int INIT_COUNTER   = 2;
final int PLAYING        = 3;

int   state           = NEW_GAME;
int   initCounter     = 0;
boolean pause         = false;

float SCALE           = 1.00;
float speed           = 1.0;
float offset_x;
float offset_y;

boolean near( float Mx, float My, float Px, float Py, float radius )
{
  return ( ( Px - Mx ) * ( Px - Mx ) + ( Py - My ) * ( Py - My ) < radius * radius );
}

float touching( Blob_t a, Blob_t b )
{
  if ( a._radius == 0.0 || b._radius == 0.0 )
    return 0.0;
     
  float dx = abs( b._x - a._x );
  float dy = abs( b._y - a._y );
  
  if ( dx > 1.0 ) dx -= 2.0;
  if ( dy > HEIGHT / WIDTH ) dy -= 2.0 * HEIGHT / WIDTH;
    
  float distance = sqrt( dx * dx + dy * dy );
  
  return a._radius + b._radius - distance;
}

boolean neartorus( float Mx, float My, float Px, float Py, float radius )
{
  return near( Mx + 0.0, My + 0.0,                  Px, Py, radius ) ||
         near( Mx + 2.0, My + 0.0,                  Px, Py, radius ) ||
         near( Mx - 2.0, My + 0.0,                  Px, Py, radius ) ||
         near( Mx + 0.0, My + 2.0 * HEIGHT / WIDTH, Px, Py, radius ) ||
         near( Mx + 0.0, My - 2.0 * HEIGHT / WIDTH, Px, Py, radius ) ||
         near( Mx + 2.0, My + 2.0 * HEIGHT / WIDTH, Px, Py, radius ) ||
         near( Mx + 2.0, My - 2.0 * HEIGHT / WIDTH, Px, Py, radius ) ||
         near( Mx - 2.0, My + 2.0 * HEIGHT / WIDTH, Px, Py, radius ) ||
         near( Mx - 2.0, My - 2.0 * HEIGHT / WIDTH, Px, Py, radius );
}

class Blob_t
{
  Blob_t( float x, float y, float vx, float vy, float radius, int c )
  {
    _x = x;
    _y = y;
    _vx = vx;
    _vy = vy;
    _radius = radius;
    _color  = c;
  }
  
  void draw( )
  {
    fill( _color, 192 );  
    ellipse( ( _x - 2.0 ) * width, ( _y - 2.0 * height / width ) * width, _radius * width * 2, _radius * width * 2 );
    ellipse( ( _x - 2.0 ) * width, ( _y + 0.0                  ) * width, _radius * width * 2, _radius * width * 2 );
    ellipse( ( _x - 2.0 ) * width, ( _y + 2.0 * height / width ) * width, _radius * width * 2, _radius * width * 2 ); 
    
    ellipse( ( _x + 0.0 ) * width, ( _y - 2.0 * height / width ) * width, _radius * width * 2, _radius * width * 2 );
    ellipse( ( _x + 0.0 ) * width, ( _y + 0.0                  ) * width, _radius * width * 2, _radius * width * 2 );
    ellipse( ( _x + 0.0 ) * width, ( _y + 2.0 * height / width ) * width, _radius * width * 2, _radius * width * 2 );
    
    ellipse( ( _x + 2.0 ) * width, ( _y - 2.0 * height / width ) * width, _radius * width * 2, _radius * width * 2 );
    ellipse( ( _x + 2.0 ) * width, ( _y + 0.0                  ) * width, _radius * width * 2, _radius * width * 2 );
    ellipse( ( _x + 2.0 ) * width, ( _y + 2.0 * height / width ) * width, _radius * width * 2, _radius * width * 2 );  
  }
  
  float _x;
  float _y;
  float _vx;
  float _vy;
  float _radius;
  int   _color;
};

ArrayList blobs;
Blob_t spaceship;

void setup( )
{
  size( 480, 480 );
  frameRate( 30 );
  noStroke();
  smooth( );
  
  initGame( );
  print( "space for new game\n" );
  print( "arrow key control speed\n" );
  
}

void initGame( )
{
  blobs = new ArrayList( );
  
  for ( int i = 0; i < BLOB_COUNT; i++ )
    blobs.add( new Blob_t( random( -1.0, 1.0 ),  random( -HEIGHT / WIDTH, HEIGHT / WIDTH ), random( -0.005, 0.005 ), random( -0.005, 0.005 ), random( 0.05 ), #ffffff ));
    
  spaceship = new Blob_t( 0.0, 0.0, 0.0, 0.0, 0.05, #ff0000 );
  
  offset_x = spaceship._x;
  offset_y = spaceship._y;
  
  SCALE = 2.0;
  speed = 1.0;  
}

float absorb( Blob_t a, Blob_t b )
{
  float overlap = touching( a, b );
  
  if ( overlap > 0.0 )
  {
    Blob_t big   =  ( a._radius > b._radius ) ? a : b;
    Blob_t small =  ( a._radius > b._radius ) ? b : a;
    
    //assert ( small._radius >= 0.0 );
    
    float inner_radius = small._radius - overlap;
    
    if ( inner_radius < 0.0 )
      inner_radius = 0.0;
      
    float smallArea = small._radius * small._radius - inner_radius * inner_radius;
    float bigArea   = big._radius   * big._radius;
    
    big._radius = sqrt( bigArea + smallArea );
    small._radius = inner_radius;
    
    return inner_radius;
  }
  
  return 0.0;
}

float bright = 0.5;

void draw( )
{
  if ( !focused )
  {
    background( 0 );
    textSize( 64 );
    textAlign( CENTER );
    if ( bright < 1.0 )
      fill( 0, 102 * bright, 153 * bright );
    else
      fill( 0, 102 * ( 2.0 - bright), 153 * ( 2.0 - bright ) );
    text( "play", WIDTH / 2, HEIGHT / 2 );
    bright += 0.02;
    if ( bright > 1.5 )
      bright = 0.5;
    return;
  }

  if ( pause )
  {
    //soundLevel = 0.0;
    return;
  }
    
  switch ( state )
  {
    case GAME_OVER :
      initCounter = 0;
      //assert( false );
      state = INIT_COUNTER;
      break;
      
    case INIT_COUNTER :
      initCounter++;
      //assert( false );
      if ( initCounter++ >= 15 * 30 )
        state = NEW_GAME;
      break;
      
    case NEW_GAME :
      initGame( );
      state = PLAYING;
      break;
      
    case PLAYING :
      break;
      
    default :
      //assert( false );
      break;
  }

  float targetScale = 0.10 / spaceship._radius;
  
  if ( targetScale < 0.5 )
    targetScale = 0.5;
    
  if ( targetScale > 2.0 )
    targetScale = 2.0; 
  
  if ( targetScale < SCALE )
  {
    SCALE *= 0.99;
    if ( targetScale > SCALE )
      SCALE = targetScale;
  }
  else if ( targetScale > SCALE )
  {
    SCALE *= 1.01;
    if ( targetScale < SCALE )
      SCALE = targetScale;
  }
  
  float target_offset_x = spaceship._x;
  float target_offset_y = spaceship._y;
  
  if ( offset_x > target_offset_x + 1.0 )
    target_offset_x -= 2.0;

  
  offset_x = target_offset_x; //
  offset_y = target_offset_y; //( 50 * offset_y + 50 * target_offset_y ) / 100;
  
  
  background( 0 );
  translate( 0.5 * width - offset_x * width * SCALE , 0.5 * height - offset_y * width * SCALE );
  scale( SCALE );
  
  float touching = 0.0;
  
  for ( int i = 0; i < blobs.size( ); i++ )
  {
    Blob_t blob = ( Blob_t ) blobs.toArray( )[ i ];
    
    touching += 16 * absorb( blob, spaceship );
    
    for ( int j = 0; j < blobs.size( ); j++ )
    {
      if ( j >= i )
        continue;
        
      absorb( ( Blob_t ) blobs.toArray( )[ i ], ( Blob_t ) blobs.toArray( )[ j ] );
    }
  }
  
  
  if ( touching > 0.0 )
  {
    //soundLevel = 0.1;
    //assert( false );
  }
  else
  {
    //soundLevel = 0.0;
  }
    
  //soundLevel = 0.2;
  
  for ( int i = blobs.size( ) - 1; i >= 0; i-- )
  {
    Blob_t blob = ( Blob_t )blobs.toArray( )[ i ];
    if ( blob._radius <= 0 )
      blobs.remove( i );
  }

  
  spaceship._x += ( spaceship._vx * speed );
  spaceship._y += ( spaceship._vy * speed );
  
  if ( spaceship._x > +1.0 )
    spaceship._x += -2.0;
  if ( spaceship._x < -1.0 )
    spaceship._x += +2.0;
      
  if ( spaceship._y > +HEIGHT / WIDTH )
    spaceship._y += -2.0 * HEIGHT / WIDTH;
  if ( spaceship._y < -HEIGHT / WIDTH )
    spaceship._y += +2.0 * HEIGHT / WIDTH;
  
  float blobsArea = 0.0;
  
  for ( int i = 0; i < blobs.size( ); i++ )
  {
    Blob_t blob = ( Blob_t )blobs.toArray( )[ i ];
    blob._x += blob._vx * speed;
    blob._y += blob._vy * speed;
    
    blobsArea = blobsArea + blob._radius * blob._radius;
    
    if ( blob._x > +1.0 )
      blob._x += -2.0;
    if ( blob._x < -1.0 )
      blob._x += +2.0;
      
    if ( blob._y > +HEIGHT / WIDTH )
      blob._y += -2.0 * HEIGHT / WIDTH;
    if ( blob._y < -HEIGHT / WIDTH )
      blob._y += +2.0 * HEIGHT / WIDTH;   
     
    blob.draw( ); 
  }
  
  Blob_t a = ( Blob_t ) spaceship;
  a.draw( );
  
  float spaceshipArea = spaceship._radius * spaceship._radius;
  
  if ( state == PLAYING && ( blobs.size( ) <= 1 || spaceship._radius == 0.0 || spaceshipArea > blobsArea ) )
    state = GAME_OVER;
    
}

void keyPressed( )
{
  switch( key )
  {
    case ' ' :
      state = NEW_GAME;
        break;
      
    default:
      break;
  }
  
   switch ( keyCode )
  {     
      case UP :
        spaceship._vy -= .002;
        break;
        
      case DOWN :
        spaceship._vy += .002;
        break;
        
      case RIGHT :
        spaceship._vx += .002;
        break;
        
      case LEFT :
        spaceship._vx -= .002;
        break;
        
      case ENTER :
        pause = !pause;
        break;
      
      default:
        // print( keyCode ); print ( "\n" );
        break;
  }
}

