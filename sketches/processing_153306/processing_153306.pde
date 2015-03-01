
Plane p;
PVector rot;
PVector tor;
PVector[] pt;

void setup() {

  size( 600, 600, OPENGL );
  p = new Plane( 0, -30, 0 );
  rot = new PVector();
  tor = new PVector();
  pt = new PVector[ 20 ];
  for ( int i = 0; i < pt.length; i++ )
    pt[ i ] = new PVector( random( -100, 100 ), random( -100, 100 ), random( -300, 300 ) );
}

void draw() {

  rot.x =  -0.15;
  rot.y = frameCount * 0.007;

  tor.set( rot );
  tor.mult( -1 );

  p.w.y = mouseX * 4.f / width;
  p.w.z = 4 - ( mouseX * 4.f / width );
  p.xyz.y = mouseY - height / 2;

  p.update();

  background( 0 );

  pushMatrix();
  translate( width * 0.5, height * 0.5, 0 );  
  rotateX( rot.x );
  rotateY( rot.y );
  rotateZ( rot.z );

  strokeWeight( 3 );
  stroke( 255, 0, 0 );
  line( 0, 0, 0, 50, 0, 0 );
  stroke( 0, 255, 0 );
  line( 0, 0, 0, 0, 50, 0 );
  stroke( 0, 0, 255 );
  line( 0, 0, 0, 0, 0, 50 );

  p.draw( tor );

  for ( int i = 0; i < pt.length; i++ ) {
    pushMatrix();
    translate( pt[ i ].x, pt[ i ].y, pt[ i ].z );
    rotateZ( tor.z );
    rotateY( tor.y );
    rotateX( tor.x );
    strokeWeight( 1 );
    stroke( 255 );
    fill( 255, 50 );
    ellipse( 0, 0, 8, 8 );
    popMatrix();
    p.pointOnPlane( pt[ i ], tor );
  }
  
  popMatrix();
  
}

// http://www.flipcode.com/documents/matrfaq.html
// http://www.euclideanspace.com/maths/geometry/rotations/conversions/eulerToMatrix/index.htm
// heading(y), attitude(z) & bank(x) representation: 
// http://www.euclideanspace.com/maths/geometry/rotations/euler/aeroplaneGlobal1.png
// https://www.opengl.org/discussion_boards/showthread.php/159883-converting-a-3D-vector-into-three-euler-angles
// http://stackoverflow.com/questions/21622956/how-to-convert-direction-vector-to-euler-angles

/*
Plane is defined by 2 vectors: 'v' & 'w' and a position 'xyz'
By changing v or w, the nromale is altered.
draw() method just render 35 points on the plane, to make it "understandable".
*/

class Plane {

  final PVector UPv = new PVector( 0,1,0 );
  
  PVector normale; // normale
  PVector v;
  PVector w;
  PVector xyz; // point

  public Plane( float x, float y, float z ) {
    v = new PVector( 1, 0, 0 );
    v.normalize();
    w = new PVector( 0, 0, 1 );
    w.normalize();
    normale = v.cross( w );
    normale.normalize();
    xyz = new PVector( x, y, z );
  }

  public void draw( PVector rot ) {
    
    strokeWeight( 1 );
    noStroke();
    fill( 255, 50 ); 
    for ( int y = -200; y <= 200; y += 40  ) {
      for ( int x = -200; x <= 200; x += 40  ) {
        PVector ptv = new PVector();
        ptv.set( v );
        ptv.mult( x );
        PVector ptw = new PVector();
        ptw.set( w );
        ptw.mult( y );
        PVector pt = new PVector();
        pt.add( ptv );
        pt.add( ptw );
        pt.add( xyz );
        pushMatrix();
        translate( pt.x, pt.y, pt.z );
        rotateZ( rot.z );
        rotateY( rot.y );
        rotateX( rot.x );
        ellipse( 0, 0, 2, 2 );
        popMatrix();
      }
    }

    pushMatrix();
    translate( xyz.x, xyz.y, xyz.z );
    stroke( 255, 255, 0 );
    line( 0, 0, 0, 150 * v.x, 150 * v.y, 150 * v.z );
    stroke( 255, 0, 255 );
    line( 0, 0, 0, 150 * w.x, 150 * w.y, 150 * w.z );
    stroke( 127 );
    line( 0, 0, 0, 150 * normale.x, 150 * normale.y, 150 * normale.z );
    popMatrix();

  }

  public void pointOnPlane( PVector pt, PVector rot ) {
    
    float d = pt.dot( normale ) - xyz.dot( normale ); 
    
    PVector tmp = new PVector();
    tmp.set( normale );
    tmp.mult( -d );
    tmp.add( pt );
    
    pushMatrix();
    strokeWeight( 1 );
    stroke( 255, 50 );
    line( pt.x, pt.y, pt.z, tmp.x, tmp.y, tmp.z );
    translate( tmp.x, tmp.y, tmp.z );
    rotateZ( rot.z );
    rotateY( rot.y );
    rotateX( rot.x );
    stroke( 255, 0, 0 );
    fill( 255, 0, 0, 100 );
    ellipse( 0,0, 4,4 );
    
    popMatrix();
    
  }

  public void update() {
    
    v.normalize();
    w.normalize();
    
    normale = v.cross( w );
    normale.normalize();
    
  }
}



