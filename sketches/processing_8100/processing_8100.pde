
// Bezier curve
// (c) Alasdair Turner 2009

// add as many control points as you like
PVector [] ctrl_pts = { 
  new PVector( 60.0, 100.0 ),
  new PVector( 160.0, 380.0 ),
  new PVector( 340.0, 140.0 ),
  new PVector( 200.0, 60.0 )
};
int N;

void setup()
{
   N = ctrl_pts.length - 1;
   //
   size(400,400); 
   smooth();
   colorMode(RGB,1.0);
   background(0.25);
   strokeWeight(2);
   for (float u = 0; u <= 1.0; u += 0.01) {
     drawFader(u);
   }   
   strokeWeight(5);
   stroke(0.75);
   for (float u = 0; u <= 1.0; u += 0.01) {
     drawPoint(u);
   }
   strokeWeight(10);
   stroke(1.0,0.0,0.0);
   for (int i = 0; i < ctrl_pts.length; i++) {
     point( ctrl_pts[i].x, ctrl_pts[i].y );
   }
}

void drawPoint(float u)
{
  PVector pt = new PVector();
  for (int k = 0; k < ctrl_pts.length; k++) {
    PVector pt_k = new PVector( ctrl_pts[k].x, ctrl_pts[k].y );  
    pt_k.mult( fader(u,k) );
    pt.add( pt_k );
  }
  point( pt.x, pt.y );  
}

void drawFader(float u)
{
  for (int k = 0; k < ctrl_pts.length; k++) {
    float fader_level = fader(u,k);
    // create a colour to see this fader
    color k_color = color(float(N-k)/float(N),0.5,float(k)/float(N));
    stroke(k_color);
    point(u*width, height-(fader_level*height));
  }
}

float fader( float u, int k )
{
  // This is a Bezier blending function
  // u^k * (1-u)^(N-k) * N! / (k! * (N-k)!)
  float fader_level = 
     pow(u,k) * pow(1-u,N-k) * fac(N) / (fac(k) * fac(N-k));
  return fader_level;
}

float fac(int v)
{
  float f = 1;
  for (int i = v; i > 1; i--) {
    f *= i;
  }  
  return f;
}


