
/*

ABOUT
----------------------------------------------------------------------
trying to find a way to diffuse points on a sphere:
the points are placed randomly.
at each draw, each point will be pushed away by its closest neighbour.
the system is never stable, and is not perfect either: 
some points are sticking to each other.

CONTROLS
----------------------------------------------------------------------
- press arrow UP and DOWN to add or remove points
- click to randomise positions

frankiezafe@gmail.com - 03/04/2013

*/

int vnum = 100;
// enable animation, if 1 -> correction in one pass
float correctionspeed = 0.01f;

ArrayList< PVector[] > vs; // contains 0:original, 1:current and 2:target

PVector[] strengthvectors;
float[] strengths;
PVector tmpv;
PVector tmpv2;
PVector tmpv3;
PVector[] closest3 = new PVector[3];

float halfw, halfh;

final static int METHOD_ALL_AT_ONCE =   0;
final static int METHOD_CLOSEST =       1;
final static int METHOD_3_CLOSEST =     2;
int method = METHOD_3_CLOSEST;

boolean drawtarget = false;

void setup() {

  size( 600, 600, P3D );

  halfw = width * 0.5f;
  halfh = height * 0.5f;

  vs = new ArrayList< PVector[] >();
  tmpv = new PVector();
  tmpv2 = new PVector();
  tmpv3 = new PVector();

  initLists();

  fill( 0 );
  strokeWeight(1.5);
}

void initLists() {

  while ( vnum < vs.size () ) {
    vs.remove( 0 );
  }
  while ( vs.size () < vnum ) {
    PVector v[] = new PVector[3];
    v[0] = new PVector( random(-1, 1), random(-1, 1), random(-1, 1) );
    v[0].normalize();
    v[1] = new PVector( v[0].x, v[0].y, v[0].z );
    v[2] = new PVector( v[0].x, v[0].y, v[0].z );
    vs.add( v );
  }

  strengths = new float[ vnum-1 ];
  strengthvectors = new PVector[ vnum-1 ];
  for ( int i = 0; i < vnum-1; i++ ) {
    strengths[i] = 0;
    strengthvectors[i] = new PVector();
  }
}

void draw() {

  background( 255 );
  translate( halfw, halfh, -halfw );

  float rx = frameCount * 0.001f;
  float ry = frameCount * 0.0023f;

  rotateX( rx );
  rotateY( ry );

  noFill();
  stroke( 255, 0, 90, 50 );
  sphere( halfh );

  for ( int i = 0; i < vnum; i++ ) {

    PVector v = vs.get(i)[0];
    PVector currentv = vs.get(i)[1];
    PVector targetv = vs.get(i)[2];


    tmpv.set( 0, 0, 0 );

    if ( method == METHOD_ALL_AT_ONCE ) {

      // process distance to others
      float totalstrength = 0;
      int strengthindex = 0;
      for ( int j = 0; j < vnum; j++ ) {

        if ( i != j ) {

          PVector vj = vs.get(j)[0];
          // calculate pushing vector
          strengthvectors[ strengthindex ].set( v );
          strengthvectors[ strengthindex ].sub( vj );
          strengths[ strengthindex ] = strengthvectors[ strengthindex ].mag();
          totalstrength += strengths[ strengthindex ];
          strengthindex++;
        }
      }

      for ( int j = 0; j < vnum-1; j++ ) {
        // strength ratio
        float r = strengths[ j ];
        strengthvectors[ j ].mult( totalstrength * strengths[ j ] );
        tmpv.add( strengthvectors[ j ] );
      }
    } 
    else if ( method == METHOD_CLOSEST ) {

      // seeking closest point
      float closestd = -1;
      for ( int j = 0; j < vnum; j++ ) {
        if ( i != j ) {
          PVector vj = vs.get(j)[0];
          if ( closestd == -1 ) {
            closestd = currentv.dist( vj );
            tmpv.set( currentv );
            tmpv.sub( vj );
          } 
          else {
            float d = currentv.dist( vj );
            if ( d < closestd ) {
              closestd = d;
              tmpv.set( currentv );
              tmpv.sub( vj );
            }
          }
        }
        tmpv.normalize();
        tmpv.mult( halfh );
      }
    } 
    else if ( method == METHOD_3_CLOSEST ) {

      // seeking the 3 closest points
      // resetting them first
      closest3[0] = null;
      closest3[1] = null;
      closest3[2] = null;
      float closestd = -1;
      for ( int j = 0; j < vnum; j++ ) {
        if ( i != j ) {
          PVector vj = vs.get(j)[0];
          if ( closestd == -1 ) {
            closestd = currentv.dist( vj );
            closest3[0] = vj;
          } 
          else {
            float d = currentv.dist( vj );
            if ( d < closestd ) {
              closestd = d;
              closest3[2] = closest3[1];
              closest3[1] = closest3[0];
              closest3[0] = vj;
            }
          }
        }
      }
      if ( closest3[0] != null ) {
        tmpv2.set( currentv );
        tmpv2.sub( closest3[0] );
        tmpv2.mult( 1 );
        tmpv.set( tmpv2 );
        if ( closest3[1] != null ) {
          tmpv2.set( currentv );
          tmpv2.sub( closest3[1] );
          tmpv2.mult( 0.5f );
          tmpv.add( tmpv2 );
          if ( closest3[2] != null ) {
            tmpv2.set( currentv );
            tmpv2.sub( closest3[2] );
            tmpv2.mult( 0.25f );
            tmpv.add( tmpv2 );
          }
        }
      }
    }

    targetv.set( v );
    targetv.add( tmpv );
    targetv.normalize();

    // vector current -> target
    tmpv.set( targetv );
    tmpv.sub( currentv );
    tmpv.mult( correctionspeed );
    currentv.add( tmpv );


    // and draw
    tmpv.set( v );
    tmpv.mult( halfh );
    tmpv2.set( currentv );
    tmpv2.mult( halfh );
    tmpv3.set( targetv );
    tmpv3.mult( halfh );

    //    stroke( 255,0,255 );
    //    line( 0,0,0, tmpv2.x, tmpv2.y, tmpv2.z );
    stroke( 255, 0, 0 );
    if ( drawtarget ) {
      line( tmpv.x, tmpv.y, tmpv.z, tmpv3.x, tmpv3.y, tmpv3.z );
      line( tmpv.x, tmpv.y, tmpv.z, tmpv2.x, tmpv2.y, tmpv2.z );
      line( tmpv2.x, tmpv2.y, tmpv2.z, tmpv3.x, tmpv3.y, tmpv3.z );
      pushMatrix();
      translate( tmpv3.x, tmpv3.y, tmpv3.z  );
      rotateY( -ry );
      rotateX( -rx );
      noFill();
      stroke( 0 );
      ellipse( 0, 0, 10, 10 );
      popMatrix();
    }
    pushMatrix();
    translate( tmpv2.x, tmpv2.y, tmpv2.z  );
    rotateY( -ry );
    rotateX( -rx );
    noFill();
    fill( 0 );
    noStroke();
    ellipse( 0, 0, 4, 4 );
    rotateX( rx );
    rotateY( ry );
    stroke( 255,0,0 );
    tmpv.normalize();
    tmpv.mult( 25 );
    tmpv2.normalize();
    tmpv2.mult( 25 );
    tmpv3.normalize();
    tmpv3.mult( 25 );
    line( 0,0,0, tmpv.x, tmpv.y, tmpv.z );
    line( 0,0,0, tmpv2.x, tmpv2.y, tmpv2.z );
    line( 0,0,0, tmpv3.x, tmpv3.y, tmpv3.z );
    popMatrix();
  }

}

void mousePressed() {
  for ( int i = 0; i < vnum; i++ ) {
    PVector v = vs.get(i)[0]; 
    v.set( random(-1, 1), random(-1, 1), random(-1, 1) );
    v.normalize();
    vs.get(i)[1].set( v );
    vs.get(i)[2].set( v );
  }
}

void keyPressed() {

  if ( keyCode == 38 ) { // [arrow up]
    if ( vnum < 10 )
      vnum++;
    else
      vnum += 5;
    initLists();
  } 
  else if ( keyCode == 40 ) { // [arrow down]
    if ( vnum < 10 )
      vnum--;
    else
      vnum -= 5;
    if ( vnum < 4 )
      vnum = 4;
    initLists();
  } 
//  else if ( keyCode == 65 ) { // 'a'
//
//    method = METHOD_ALL_AT_ONCE;
//    println( "using method 'ALL AT ONCE'" );
//  } 
//  else if ( keyCode == 66 ) { // 'b'
//
//    method = METHOD_CLOSEST;
//    println( "using method 'CLOSEST'" );
//  } 
//  else if ( keyCode == 67 ) { // 'c'
//
//    method = METHOD_3_CLOSEST;
//    println( "using method '3 CLOSEST'" );
//  } 
  else {
    println( keyCode );
  }
}


