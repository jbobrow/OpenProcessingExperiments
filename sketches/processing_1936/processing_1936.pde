
float rot = 0;

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
float h = 20;

void draw()
{
  rot+=.03;
  lights();
  background(0);
  perspective(PI/3.0, float(width)/float(height), 1, 1000);
  camera( 0, 0, -50, // eyeX, eyeY, eyeZ
  0, 0, 0, // centerX, centerY, centerZ
  0.0, -1.0, 0.0); // upX, upY, upZ 
  rotateX( mouseY / 100.0 );
  rotateZ( mouseX / 100.0 );
  beginShape( QUADS );
  for( float r = 0; r < TWO_PI; r += ramt )
  {
    fill( r, 1, 1 );
    vertex( cos(r)*w, -h, sin(r)*w );
    vertex( cos(r+ramt)*w, -h, sin(r+ramt)*w );
    vertex( cos(r+ramt+rot)*w, h, sin(r+ramt+rot)*w );
    vertex( cos(r+rot)*w, h, sin(r+rot)*w );
  }
  endShape();
}


