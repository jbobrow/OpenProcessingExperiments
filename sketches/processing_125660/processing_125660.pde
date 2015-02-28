
// image: Tsang Fanny - Cartographies, 2009
// http://frankiezafe.tumblr.com/post/57239856701/blue-voids-tsang-fanny-cartographies-2009

float[] pixefs;
ArrayList< Integer > neighbours;

int area = 1;
float influence = 0.5f;
float power = 7.5f;

void setup() {
  
  size( 512,512 );
  
  PImage im = loadImage( "img.jpg" );
  
  background( 255 );
  image( im, 0, 0, width, height );
  
  neighbours = new ArrayList< Integer >();
  
  loadPixels();
  pixefs = new float[ pixels.length ];
  for ( int i = 0; i < pixels.length; i++ ) {
    pixefs[ i ] = brightness( pixels[ i ] );
  }
  
}

void process() {
  int ID = 0;
  for ( int y = 0; y < height; y++ ) {
    for ( int x = 0; x < width; x++ ) {
      ID = x + y * width;
      if ( pixefs[ ID ] != 0 )
        continue;
      if ( active( x, y ) ) {
        // println( x +" / "+ y + " has at least one neighbours who is not black" );
        getNeighbours( x, y, area );
        float inf = influence / neighbours.size();
        for ( int i = 0; i < neighbours.size(); i++ ) {
          int nid = neighbours.get( i );
          pixefs[ nid ] -= inf * pow( ( 255.f / pixefs[ nid ] ), power );
          if ( pixefs[ nid ] < 0 )
            pixefs[ nid ] = 0;
        }
      }
    }
  }
}

boolean active( int x, int y ) {
  for ( int ty = y-1; ty <= y+1; ty++ ) {
    if ( ty < 0 )
      continue;
    if ( ty >= height )
      break;
    for ( int tx = x-1; tx <= x+1; tx++ ) {
      if ( tx < 0 )
        continue;
      if ( tx >= width )
        break;
      if ( pixefs[ tx + ty * width ] > 0 )
        return true;
    }
  }
  return false;
}

void getNeighbours( int x, int y, int range ) {
  neighbours.clear();
  for ( int ty = y-range; ty <= y+range; ty++ ) {
    if ( ty < 0 )
      continue;
    if ( ty >= height )
      break;
    for ( int tx = x-range; tx <= x+range; tx++ ) {
      if ( tx < 0 )
        continue;
      if ( tx >= width )
        break;
      if ( tx == x && ty == y )
        continue;
      neighbours.add( tx + ty * width );
    }
  }
}

void draw() {
  
  process();
  for ( int i = 0; i < pixels.length; i++ )
    pixels[ i ] = color( pixefs[ i ] );
  updatePixels();

}

