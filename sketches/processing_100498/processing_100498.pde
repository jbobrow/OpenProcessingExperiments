
class MapMesh {

  Mappoint[] points;
  Mapface[] faces;
  Mappoint[] centers;

  float width;
  float height;
  float depth;
  int sampling;
  int[] grid;

  public MapMesh() {
    points = null;
    faces = null;
    centers = null;
    sampling = 0;
    grid = new int[2];
  }

  public void process( PImage img, float elevation, int sampling ) {

    this.sampling = sampling;
    width = img.width;
    height = img.height;
    depth = elevation;

    points = new Mappoint[ ceil( img.width / (float) sampling ) * ceil( img.height / (float) sampling ) ];

    // retrieving brightness of each pixels
    img.loadPixels();
    float[] pixels_brightness = new float[ img.pixels.length ];
    for ( int p=0; p < img.pixels.length; p++ )
      pixels_brightness[ p ] = brightness( img.pixels[ p ] ) / 255.f;

    // creating the map points
    grid[0] = (int) ceil( img.width / (float) sampling );
    grid[1] = (int) ceil( img.height / (float) sampling );
    int i = 0;
    int gc = 0;
    int gr = 0;
    for ( int r=0; r < img.height; r += sampling ) {
      gc = 0;
      for ( int c=0; c < img.width; c += sampling ) {
        int pix = c + ( r * img.width );
        // if sampling si > 1, than we average the surrounding pixels
        int np = 0;
        float totalb = 0;
        int halfs = (int) floor( sampling * 0.5f );
        for ( int sy = r-halfs; sy <= r+halfs; sy++ ) {
          if ( sy < 0 )
            continue;
          if ( sy >= img.height )
            break;
          for ( int sx = c-halfs; sx <= c+halfs; sx++ ) {
            if ( sx < 0 )
              continue;
            if ( sx >= img.width )
              break;
            totalb += pixels_brightness[ sx + ( sy * img.width ) ];
            np++;
          }
        }
        totalb /= np;
        points[ i ] = new Mappoint( i, gc, gr );
        points[ i ].position.set( ( c + 0.5f ), ( r + 0.5f ), totalb * depth );
        i++;
        gc++;
      }
      gr++;
    }

    // creating map faces
    int count = ( grid[0] - 1 ) * ( grid[1] - 1 ) * 2;
    faces = new Mapface[ count ];
    centers = new Mappoint[ count ];
    int facescount = 0;
    i = 0;
    for ( int r=0; r < grid[1]-1; r++ ) {
      for ( int c=0; c < grid[0]-1; c++ ) {
        i = c + r * grid[0];
        Mappoint topleft = points[ i ];
        Mappoint topright = points[ i + 1 ];
        Mappoint bottomleft = points[ i + grid[0] ];
        Mappoint bottomright = points[ i + grid[0] + 1 ];
        centers[ facescount ] = new Mappoint( facescount, 0, 0 );
        faces[ facescount ] = new Mapface( topleft, topright, bottomright, centers[ facescount ] );
        facescount++;
        centers[ facescount ] = new Mappoint( facescount, 0, 0 );
        faces[ facescount ] = new Mapface( topleft, bottomright, bottomleft, centers[ facescount ] );
        facescount++;
      }
    }
  }

  // this method return z value of the point and the value of the slope + normale values
  // output[ 0 ] : z value of the point x,y projected on the mesh
  // output[ 1 ] : slope, between -1 & 1 if the dirx & diry comes from a normalised 2D vector
  // output[ 2 -> 4 ] : normale
  public float[] getDepth( float x, float y, float dirx, float diry ) {
    if ( x < 0 || x >= width || y < 0 || y >= height )
      return new float[] { 0,0 };
    int[] top = new int[ 2 ];
    int[] bottom = new int[ 2 ];
    // locate the closest point:
    int c = (int) ( x / sampling );
    int r = (int) ( y / sampling );

    top[ 0 ] = c; 
    top[ 1 ] = r;
    if ( c < grid[0]-1 && r < grid[1]-1 ) {
      bottom[ 0 ] = c+1; 
      bottom[ 1 ] = r+1;
    } else if ( c < grid[0]-1 ) {
      bottom[ 0 ] = c+1; 
      bottom[ 1 ] = r; 
      top[ 1 ] = r-1;
    } else if ( r < grid[1]-1 ) {
      bottom[ 0 ] = c; 
      bottom[ 1 ] = r+1; 
      top[ 0 ] = c-1;
    } else {
      bottom[ 0 ] = c; 
      bottom[ 1 ] = r; 
      top[ 0 ] = c-1; 
      top[ 1 ] = r-1;
    }

    int p1 = top[ 0 ] + top[ 1 ] * grid[ 0 ];
    int p2 = bottom[ 0 ] + bottom[ 1 ] * grid[ 0 ];

    // get top face
    int fid = ( top[ 0 ] + ( grid[0] - 1 ) * top[ 1 ] ) * 2;
    int tmpf = fid + 1;
    if ( 
      dist( centers[ fid ].position.x, centers[ fid ].position.y, x, y ) >
      dist( centers[ tmpf ].position.x, centers[ tmpf ].position.y, x, y )
      ) {
      fid = tmpf;
    }
    Mapface f = faces[ fid ];
    Mappoint ce = centers[ fid ];
  
    float[] output = new float[ 5 ];
    output[ 0 ] = f.getZprojection( x,y );
    output[ 1 ] = f.normale.x * dirx + f.normale.y * diry;
    output[ 2 ] = f.normale.x;
    output[ 3 ] = f.normale.y;
    output[ 4 ] = f.normale.z;
    return output;
    
  }
}


