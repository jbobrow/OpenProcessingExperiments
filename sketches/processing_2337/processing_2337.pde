
int size = 40;
float scale = 10;


float[][] hmap = new float[size][size];

Rocks rocks = new Rocks();

void setup()
{
  size( 800, 600, P3D );
  frameRate( 30 );
  sphereDetail( 3 );
  noStroke();
}

void draw()
{
  lights();
  background( 128, 128, 128 );
  perspective(PI/3.0, float(width)/float(height), 1, 10000);
  camera( 0, -mouseY,  mouseY+ 40, // eyeX, eyeY, eyeZ
  0, 0, 50, // centerX, centerY, centerZ
  0.0, 0.0, -1.0); // upX, upY, upZ 
  rotateZ( mouseX / 100.0 );
  translate( -size/2 * scale, -size/2 * scale, 0 );
  beginShape( QUADS );
  float max = 0;
  for( int x = 0; x < size-1; x++ )
  {
    for( int y = 0; y < size-1; y++ )
    {
      max = max( hmap[x][y], max );
      fill( hmap[x][y] + 128, 128, 128 );
      vertex( x * scale, y * scale, hmap[x][y] );
      vertex( (x+1) * scale, y * scale, hmap[x+1][y] );
      vertex( (x+1) * scale, (y+1) * scale, hmap[x+1][y+1] );
      vertex( x * scale, (y+1) * scale, hmap[x][y+1] );
    }
  } 
  endShape();
  hmap[size/2][size/2] = max;
  rocks.update();
}

float[][] mask;

public class Rocks
{
  ArrayList rocks = new ArrayList();

  public Rocks()
  {
    mask = new float[5][5];
    for( int x = 0; x < 5; x++ )
    {
      for( int y = 0; y < 5; y++ )
      {
        mask[x][y] = constrain( 1 - dist( x, y, 2.5, 2.5 ), 0, 3 ) * 3;
      }
    }    
  }

  public void update()
  {
    rocks.add( new Rock() );
    rocks.add( new Rock() );
    rocks.add( new Rock() );

    for( int i = 0; i < rocks.size(); i++ )
    {
      Rock r = (Rock)rocks.get(i);
      if( r.alive )
        r.update();
      else
      {
        rocks.remove( r );
        i--; 
      }
    } 
  }

}

public class Rock
{
  float start = 6;
  float angle = random( 0, TWO_PI );
  float mag = random( .2, 1.6 );
  PVector loc = new PVector( size/2 * scale, size/2 * scale, hmap[size/2][size/2] + 10);
  PVector speed = new PVector( cos(angle)*mag, sin(angle)*mag, random( 0, start ) );
  boolean alive = true;

  public void update()
  {
    speed.z -= .1;
    loc.add( speed );
    pushMatrix();
    translate( loc.x, loc.y, loc.z );
    sphere( 2 );
    popMatrix();
    if( loc.x < 0 || loc.x > size*scale || loc.y < 0 || loc.y > size*scale )
    {
    }
    else if( loc.z < 0 || loc.z < hmap[(int)constrain(loc.x / scale, 0, size)][(int)constrain(loc.y / scale, 0, size)] )
    {
      int xx = ((int)(loc.x / scale));
      int yy = ((int)(loc.y / scale));
      int minX = constrain(xx - 2, 0, size);
      int minY = constrain(yy - 2, 0, size);
      int maxX = constrain(xx + 2, 0, size);
      int maxY = constrain(yy + 2, 0, size);
      for( int x = minX; x < maxX; x++ )
      {
        for( int y = minY; y < maxY; y++ )
        {
          float val = mask[xx-x+2][yy-y+2];
          hmap[x][y] += val; 
        }
      }
      alive = false;  
    }
  }
}










