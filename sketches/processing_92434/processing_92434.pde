
class MeshPoint {
  
  public float x;
  public float y;
  public float z;
  public float size;
  public MeshPoint direction;
  
  public MeshPoint() {
    x = 0;
    y = 0;
    z = 0;
    size = 0;
    direction = new MeshPoint( true );
  }
  
  public MeshPoint( boolean nodirection ) {
    x = 0;
    y = 0;
    z = 0;
    size = 0;
  }
  
  public MeshPoint( float x, float y, float z ) {
    this.x = x;
    this.y = y;
    this.z = z;
    size = 0;
    direction = new MeshPoint( true );
  }
  
  public void set( float x, float y, float z ) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  public void set( MeshPoint mp ) {
    x = mp.x;
    y = mp.y;
    z = mp.z;
  }

  public void plus( float x, float y, float z ) {
    this.x += x;
    this.y += y;
    this.z += z;
  }
  
  public void plus( MeshPoint mp ) {
    x += mp.x;
    y += mp.y;
    z += mp.z;
  }
  
  public void minus( float x, float y, float z ) {
    this.x -= x;
    this.y -= y;
    this.z -= z;
  }
  
  public void minus( MeshPoint mp ) {
    x -= mp.x;
    y -= mp.y;
    z -= mp.z;
  }
  
  public void multiply( float m ) {
    x *= m;
    y *= m;
    z *= m;
  }
  
  public float dist( MeshPoint mp ) {
    MeshPoint d = new MeshPoint( true );
    d.plus( mp );
    d.minus( this );
    return d.len();
  }
  
  public float len() {
    return sqrt( pow( x,2 ) + pow( y,2 ) + pow( z,2 ) );
  }
  
  public void normalise() {
    float  l = len();
    l = 1/l;
    x *= l;
    y *= l;
    z *= l;
  }
  
}

