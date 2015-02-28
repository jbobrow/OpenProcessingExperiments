
Map map = new Map();

PImage tree;
PImage brick;

PVector camloc = new PVector();
float heading = 0;

ArrayList mapObjs = new ArrayList();

void setup()
{
  textureMode( NORMALIZED );
  tree = loadImage( "tree1.png" );
  brick = loadImage( "rock.png" );
  size( 800, 600, P3D );
  noStroke();
  frameRate( 30 );
  //noLoop();
  mapObjs.add( new Castle( 300, 300 ) );
  for( int i = 0; i < 100; i++ )
  {
    mapObjs.add( new Tree() ); 
  }
}

void draw()
{
  float zHeight = map.getHeight( camloc.x, camloc.y );
  perspective(PConstants.PI/3.0f, PApplet.parseFloat(width)/PApplet.parseFloat(height), 1, 10000);
  camera( camloc.x, camloc.y, zHeight + 15, // eyeX, eyeY, eyeZ
  camloc.x + cos( heading ), camloc.y + sin( heading ), zHeight + 14.9, // centerX, centerY, centerZ
  0.0, 0.0, -1.0); // upX, upY, upZ 
  lights();
  background(140, 200, 255);
  map.render();
  for( int i = 0; i < mapObjs.size(); i++ )
  {
    MapObject obj = (MapObject)mapObjs.get(i);
    obj.render(); 
  }
}

public class Map
{
  float[][] hmap = new float[50][50];

  float maxHeight = 300;
  float scale = 20;

  public Map()
  {
    for( int y = 0; y < hmap[0].length; y++ )
    {
      for( int x = 0; x < hmap.length; x++ )
      {
        hmap[x][y] = noise( x*.1, y*.1 );
      }
    }   
  }

  public float getHeight( float x, float y )
  {
    float xs = x/scale;
    float ys = y/scale;
    int xi = (int)xs;
    int yi = (int)ys;
    if( xi < hmap.length - 1 && yi < hmap[0].length - 1 && xi >= 0 && yi >= 0 )
    {
      PVector P = new PVector( (xi) * scale, (yi) * scale, hmap[xi][yi] );
      PVector Q = new PVector( P.x, P.y );
      PVector R = new PVector( P.x + scale, P.y + scale, hmap[xi+1][yi+1] );
      if( xs-xi > ys-yi )
      {
        Q.x += scale;
        Q.z = hmap[xi+1][yi];
      }
      else
      {
        Q.y += scale;
        Q.z = hmap[xi][yi+1]; 
      }

      float z = triHeight( new PVector(x,y,0), P, Q, R );

      return z * maxHeight; 
    }
    else return 0;
  }

  public void render()
  {
    beginShape( QUADS );
    for( int y = 0; y < hmap[0].length - 1; y++ )
    {
      for( int x = 0; x < hmap.length - 1; x++ )
      {
        fill( 128, hmap[x][y] * 200 + 55, 0 );
        vertex( x * 20, y * 20, hmap[x][y] * maxHeight );

        fill( 128, hmap[x+1][y] * 200 + 55, 0 );
        vertex( (x+1) * 20, y * 20, hmap[x+1][y] * maxHeight );

        fill( 128, hmap[x+1][y+1] * 200 + 55, 0 );
        vertex( (x+1) * 20, (y+1) * 20, hmap[x+1][y+1] * maxHeight );

        fill( 128, hmap[x][y+1] * 200 + 55, 0 );
        vertex( x * 20, (y+1) * 20, hmap[x][y+1] * maxHeight );
      }
    }
    endShape();
  } 
}

public class Tree extends MapObject
{
  public Tree()
  {
    loc = new PVector(random(1000), random(1000));
    loc.z = map.getHeight( loc.x, loc.y );
  }

  public void render()
  {
    //hint( DISABLE_DEPTH_TEST );
    pushMatrix();
    translate( loc.x, loc.y, loc.z );
    scale( .3 );
    beginShape( QUADS );
    texture( tree );
    vertex( 0, -30, 0, 0, 1 );
    vertex( 0, 30, 0, 1, 1 );
    vertex( 0, 30, 60, 1, 0 );
    vertex( 0, -30, 60, 0, 0 );

    vertex( -30, 0, 0, 0, 1 );
    vertex( 30, 0, 0, 1, 1 );
    vertex( 30, 0, 60, 1, 0 );
    vertex( -30, 0, 60, 0, 0 );
    endShape();

    popMatrix();
    //hint( ENABLE_DEPTH_TEST );


  }
}

public class Castle extends MapObject
{

  float wallHeight = 40;

  public Castle( float x, float y )
  {
    loc = new PVector( x, y, map.getHeight( x, y ) );
  }

  public void render()
  {
    fill( 128 );
    pushMatrix();  
    translate( loc.x, loc.y, loc.z ); 

    beginShape( QUADS );
    texture( brick );
    vertex( -20, 20, -100, 0, 0 );
    vertex( 20, 20, -100, 1, 0 );
    vertex( 20, 20, wallHeight, 1, 1 );
    vertex( -20, 20, wallHeight, 0, 1 );

    vertex( -20, -20, -100, 0, 0 );
    vertex( 20, -20, -100, 1, 0 );
    vertex( 20, -20, wallHeight, 1, 1 );
    vertex( -20, -20, wallHeight, 0, 1 );

    vertex( -20, 20, -100, 1, 0 );
    vertex( -20, -20, -100, 0, 0 );
    vertex( -20, -20, wallHeight, 0, 1 );
    vertex( -20, 20, wallHeight, 1, 1 );

    vertex( 20, 20, -100, 1, 0 );
    vertex( 20, -20, -100, 0, 0 );
    vertex( 20, -20, wallHeight, 0, 1 );
    vertex( 20, 20, wallHeight, 1, 1 );
    endShape();
    cylinder( -20, -20, -100, wallHeight+5, 5, 10 );
    cylinder( 20, -20, -100, wallHeight+5, 5, 10 );
    cylinder( 20, 20, -100, wallHeight+5, 5, 10 );
    cylinder( -20, 20, -100, wallHeight+5, 5, 10 );
    popMatrix();
  }

  public void cylinder( float x, float y, float base, float top, float w, float res )
  {
    float inc = TWO_PI / res;
    beginShape( QUADS );
    for( float i = 0; i < TWO_PI; i += inc )
    {
      texture( brick );
      float u = i / TWO_PI;
      float u2 = u + (inc / TWO_PI);
      vertex( x+cos(i)*w, y+sin(i)*w, base, u, 0 );
      vertex( x+cos(i+inc)*w, y+sin(i+inc)*w, base, u2, 0 );
      vertex( x+cos(i+inc)*w, y+sin(i+inc)*w, top, u2, 1 );
      vertex( x+cos(i)*w, y+sin(i)*w, top, u, 1 );   
    }
    endShape();
  }
}

public abstract class MapObject implements Comparable
{
  PVector loc;

  public abstract void render();
  
  public int compareTo( Object obj )
  {
    MapObject mo = (MapObject)obj;
    if( mo.loc.dist( camloc ) > loc.dist( camloc ) )
     return 1;
    else return -1;
  }
}

public void keyPressed()
{
  if( key == CODED )
  {
    if( keyCode == LEFT )
    {
      heading-=.1;
    }
    if( keyCode == RIGHT )
    {
      heading+=.1;
    } 
    if( keyCode == UP )
    {
      camloc.add( new PVector( cos( heading ), sin( heading ) ) );
    }
    if( keyCode == DOWN )
    {
      camloc.sub( new PVector( cos( heading ), sin( heading ) ) );
    } 
  }
}

public float triHeight(PVector pt, PVector pt0, PVector pt1, PVector pt2)
{
  //  println( "begin" );
  //  println( pt.toString() );
  //  println( pt0.toString() );
  //  println( pt1.toString() );
  //  println( pt2.toString() );
  //  println( "end" );
  float epsilon = .00001;
  PVector raydir = new PVector( 0, 0, 1 );
  PVector e1 = new PVector();
  PVector e2 = new PVector();
  e1 = PVector.sub(pt1, pt0);
  e2 = PVector.sub(pt2, pt0);
  PVector p = new PVector();
  p = raydir.cross( e2 );
  float a;
  a = e1.dot(p);

  if( a > -epsilon && a < epsilon )
  {
    println( "epsilon fail" );
    return 0;
  }

  float f = 1.0 / a;
  PVector s = new PVector();
  s = PVector.sub(pt, pt0);
  float u = f * s.dot(p);


  PVector q = new PVector();
  q = s.cross( e1 );
 

  float t = f * e2.dot(q);

  PVector pos = new PVector();
  pos.set(raydir);

  pos.mult(t);

  //pos.add(pt);
  return pos.z;

}


