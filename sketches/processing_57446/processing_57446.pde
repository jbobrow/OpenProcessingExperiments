
/*
  Research of an aesthetic perception of a Bezier curve segment.
  Each line is a single segment, defined by 4 points:
  Start, End and the two control points inbetween.
  Start point is common for all: the bottom point.
  End points are determined by "angle" and are spread over the circle.
  Both bezier handles points to the circle center.
  Mouse position controls the proportion: 
    length of handles to the distance between Start and End points.
  By SergeiSokolov.com, March 2012
*/
float margin = 10;
PVector tormoz;
void setup(){
  size(400,400);
  smooth();
  tormoz = new PVector( 0, 0);
}

void draw() {
  float k;
  float inertia = 20;
  tormoz.x += ( mouseX - tormoz.x) / inertia;
  tormoz.y += ( mouseY - tormoz.y) / inertia;
  k = map( tormoz.y, height, 0, 0, 2.5);
  background(255);
  colorMode(HSB);
  plot( k);
}

void plot( float k) {
  // k 0 .. 0.5 - length of control handle, rel to AB distance
  noFill();
  pushMatrix();
  translate(width/2, height - margin);
  rotate( -HALF_PI);
  int steps = 80;
  float R = ( min( width, height) - 2 * margin) / 2;

  for( float a = 0; a < PI; a+= (PI/steps)){
    stroke( color( map(a,0,PI,0,512)%255, 190, 180) );
    lap( a, k, R, true);
    lap( a, k, R, false);
  }
  popMatrix();
}


void lap(float angle, float k, float R, Boolean up) {
  int sign = up ? -1 : 1;
//  float k = 1 - .681; // length of control handle, relative to AB distance
  float sa = sin(angle);
  float ca = cos(angle);
//  float R = ( min( width, height) - 2 * margin) / 2;
  float outX = R + R * ca;
  float outY = 0 + sign * R * sa;
  float d = sqrt( outX*outX + outY*outY);
  float cp1X = k * d;
  float cp1Y = 0;
  float cp2X = R + (R - k*d) * ca;
  float cp2Y = 0 + sign * (R - k*d) * sa;
  bezier ( 0, 0, cp1X, cp1Y, cp2X, cp2Y, outX, outY);
}

