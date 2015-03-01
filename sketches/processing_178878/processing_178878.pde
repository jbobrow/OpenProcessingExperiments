
// Fractal Trio
// ------------ //
// @paulsobrien

// vars
int _width = 400;
int _height = 400;
int r = 20;
int g = 120;
int b = 100;
float cx, cy, curlTheta, curlBeta, mouseTheta;


// ----------------- //
//       SETUP
// ------------------//
void setup()
{
  size(_width, _height);
  background(r,g,b);
  frameRate(48);
  smooth(1);
  strokeWeight(1);
  stroke(0, 0, 0, 0);
  noStroke();
  cx = _width/2f;
  cy = _height/2f;
}

// ----------------- //
//       DRAW
// ------------------//
void draw()
{
  background(r,g,b);
  
  // mouse control
  float a = (mouseY / (float) width) * 90f;
  mouseTheta = radians(a);
  
  // curling effect with different theta offsets
  curlTheta -= 0.022f;
  curlBeta += 0.009f;
  
  // values: float _x, float _y, float _size, float _sides, float _rads, r, g, b, a
  renderCurlBrancher( cx, cy, 60, 5,  72, curlBeta,   222,222,222, 100 );
  renderCurlBrancher( cx, cy, 50, 6,  60, curlTheta,  255, 22, 22, 150 );
  renderCurlBrancher( cx, cy, 40, 3, 120, mouseTheta,  22, 22, 22, 200 );
  renderCurlBrancher( cx, cy, 45, 3, 120, mouseTheta,  22,255,255, 100 );
}

// ----------------- //
//      BRANCHES
// ------------------//
void branchLineCurl( float h, float _theta, int r, int g, int b, int a ) // h is size
{
  h *= 0.80f;               // decrease
  strokeWeight(h/1);        // decreased line thickness
  
  if (h > 1)                // dont calculate anything below 1 pixel
  {
    pushMatrix();    
      rotate(_theta);       // keep spinning
      drawBranchLine(0, -h, r, g, b, a);  
      translate(0, -h); 
      branchLineCurl(h, _theta, r, g, b, a);       
    popMatrix();                 
  }
}

void drawBranchLine(float w, float h, int r, int g, int b, int a)
{ 
  stroke(r,g,b, a);
  beginShape(LINES);       
    vertex(w,0);
    vertex(w,h);
  endShape();
  }

void renderCurlBrancher(float _x, float _y, float _size, float _sides, float _rads, float _theta, int r, int g, int b, int a)
{
  for(int i=0; i < _sides; i++)
  {
   pushMatrix();
     translate( _x, _y );
     rotate(radians(_rads * i));
     translate(0,0);
     drawBranchLine(0, 0, r, g, b, a);
     branchLineCurl(_size, _theta, r, g, b, a);
   popMatrix();
  }
}








