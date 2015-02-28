
ArrayList balls = new ArrayList();

int s = 300;

boolean smoo = false;

void setup()
{
  size( 400, 400, P3D );
  frameRate( 30 );
  noStroke();
  colorMode( HSB, 360, 255, 255 );
  for( int i = 0; i < 200; i++ )
  {
     balls.add( new Ball() ); 
  }
  sphereDetail( 4 );
}

void draw()
{
  lights();
  background(216, 150, 200);
  perspective(PI/3.0, float(width)/float(height), 1, 1000);
  camera( 0, 5+mouseY, -100 - mouseY, // eyeX, eyeY, eyeZ
  0, 15, 0, // centerX, centerY, centerZ
  0.0, -1.0, 0.0); // upX, upY, upZ 
  fill( 1, 0, 128 );
  rotateY( mouseX / 100.0 );
  beginShape( QUADS );
    vertex( -s, -1, -s );
    vertex( s, -1, -s );
    vertex( s, -1, s );
    vertex( -s, -1, s );
  endShape();
  for( int i = 0; i < balls.size(); i++ )
  {
    Ball b = (Ball)balls.get(i);
    b.update();
  }
  
}

public class Ball
{
  PVector loc;
  PVector speed;
  color c;
  
  public Ball()
  {
      spawn();
  }
  
  public void spawn()
  {
    loc = new PVector( 0, 15, 0 );
    speed = new PVector( random( -1, 1 ), random( -3, 3 ), random( -1, 1 ) );
    c = color( random(360), 255, 255 );
  }
  
  public void update()
  {
     speed.y -= .1;
     if( loc.y <= 0 )
     {
        speed.y = abs(speed.y) * .95; 
     }
     if( loc.z > s || loc.z < -s || loc.x > s || loc.x < -s )
     {
       spawn();
     }
     loc.add( speed );
     fill( c );
     pushMatrix();
     translate( loc.x, loc.y + 1, loc.z );
     sphere( 2 );
     popMatrix();
     fill( 0, 0, 10 );
     float si = (40.0 - loc.y) / 30.0;
     if( si < 0 ) si = 0;
     beginShape( QUADS );
     vertex( loc.x + si, -.9, loc.z + si );
     vertex( loc.x - si, -.9, loc.z + si );
     vertex( loc.x - si, -.9, loc.z - si );
     vertex( loc.x + si, -.9, loc.z - si );
     endShape();
  } 
}

void keyPressed()
{
   if( smoo )
  {
     smooth();
     smoo = false;
  } 
  else
  {
     noSmooth();
    smoo = true; 
  }
}

