
class Box {
  float[] x, y;
  color c;
  Box() {
    c = color( random(1.0), random(0.2,0.5), random(0.5,0.8) );
    x = new float[4];
    y = new float[4];
  }
}

ArrayList oldBoxes, newBoxes;

void setup()
{
  size(800,480,P2D);
  smooth();
  frameRate(32);
  reset();
}

void mousePressed()
{
  reset();
}

void keyPressed()
{
  drawFill = !drawFill;
}

void reset()
{
  oldBoxes = new ArrayList();
  newBoxes = new ArrayList();
  colorMode(HSB,1.0,1.0,1.0);
  Box top = new Box();
  top.x[0] = width;
  top.x[1] = 0;
  top.x[2] = 0;
  top.x[3] = width;
  top.y[0] = height;
  top.y[1] = height;
  top.y[2] = 0;
  top.y[3] = 0;
  oldBoxes.add(top);
}

boolean drawFill = true;

void draw()
{
  background(0);
  noFill();
  noStroke();
  for( int i = 0; i < oldBoxes.size(); ++i ) {
    Box b = (Box) oldBoxes.get(i);
    if( drawFill ) {
      fill( b.c ); 
    } else {
      stroke( 0, 0, 1 );
      strokeWeight(1.0);
    }
    quad( b.x[0], b.y[0], b.x[1], b.y[1], b.x[2], b.y[2], b.x[3], b.y[3] );
  }
  for( int i = 0; i < newBoxes.size(); ++i ) {
    Box b = (Box) newBoxes.get(i);
    if( drawFill ) {
      fill( b.c ); 
    } else {
      stroke( 0, 0, 1 );
      strokeWeight(1.0);
    }
    quad( b.x[0], b.y[0], b.x[1], b.y[1], b.x[2], b.y[2], b.x[3], b.y[3] );
  } 
  if( oldBoxes.size() == 0 ) {
    oldBoxes = newBoxes;
    newBoxes = new ArrayList();
  }
  int i = oldBoxes.size() -1;
  Box b = (Box) oldBoxes.remove(i);
  float side_a = sqrt( pow(b.x[0] - b.x[1],2.0) + pow(b.y[0] - b.y[1],2.0) );
  float side_b = sqrt( pow(b.x[2] - b.x[1],2.0) + pow(b.y[2] - b.y[1],2.0) );
  if( side_b/side_a > 2.0 ) {
    Box rotated = new Box();
    rotated.c = b.c;
    rotated.x[0] = b.x[3];
    rotated.x[1] = b.x[0];
    rotated.x[2] = b.x[1];
    rotated.x[3] = b.x[2];
    rotated.y[0] = b.y[3];
    rotated.y[1] = b.y[0];
    rotated.y[2] = b.y[1];
    rotated.y[3] = b.y[2];
    oldBoxes.add(rotated);
  } else {    
    float zeta = random(0.25,0.75);
    float x4 = b.x[0] + zeta*(b.x[1] -b.x[0]);
    float y4 = b.y[0] + zeta*(b.y[1] -b.y[0]);
    float x5, y5;
    x5 = b.x[3] + zeta*(b.x[2] -b.x[3]);
    y5 = b.y[3] + zeta*(b.y[2] -b.y[3]);
    Box result_a = new Box();
    result_a.c = color( (hue(b.c) + random(0.05)) % 1.0, saturation(b.c), brightness(b.c));
    Box result_b = new Box();
    result_a.c = color( (hue(b.c) + random(0.05)) % 1.0, saturation(b.c), brightness(b.c));
    
    result_a.x[0] = x4;
    result_a.x[1] = x5;
    result_a.x[2] = b.x[3];
    result_a.x[3] = b.x[0];
    result_a.y[0] = y4;
    result_a.y[1] = y5;
    result_a.y[2] = b.y[3];
    result_a.y[3] = b.y[0];
    
    result_b.x[0] = x4;
    result_b.x[1] = x5;
    result_b.x[2] = b.x[2];
    result_b.x[3] = b.x[1];
    result_b.y[0] = y4;
    result_b.y[1] = y5;
    result_b.y[2] = b.y[2];
    result_b.y[3] = b.y[1];
    
    newBoxes.add(result_a);
    newBoxes.add(result_b);
  }
}
  

