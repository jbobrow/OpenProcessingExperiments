
void setup()
{
  size( 400, 400, P3D );
  frameRate( 30 );
  smooth();
  colorMode( HSB, TWO_PI, 1, 1 );
  noStroke();
}

float w = 10;
float ramt = TWO_PI/30.f;
float h = 1;
float rot = 0;

void draw()
{
  rot+=.03;
  lights();
  background(0);
  perspective(PI/3.0, float(width)/float(height), 1, 1000);
  camera( 0, 0, -25, // eyeX, eyeY, eyeZ
  15, 0, 0, // centerX, centerY, centerZ
  0.0, -1.0, 0.0); // upX, upY, upZ 
  translate( 15, 0, 0 );
  rotateX( mouseY / 70.0 );
  rotateZ( mouseX / 70.0 );
  translate( -15, 0, 0 );
  beginShape( QUADS );
  for( float r = 0; r < 30; r += ramt )
  {
    fill( r%TWO_PI, 1, 1 );
    vertex( r, sin(r)*h, -w );
    vertex( r+ramt, sin(r+ramt)*h, -w );
    vertex( r+ramt, sin(r+ramt+rot)*h, w );
    vertex( r, sin(r+rot)*h, w );
  }
  endShape();
}

