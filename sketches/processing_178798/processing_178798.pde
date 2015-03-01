
// Random Falling Stars
// ----------------- //
// @paulsobrien


// vars
int num_stars = 24;
int dirX = 0;
int dirY = 0;
float theta = 0.0f;
float amplitude = 100.0f;
float starMaxSize = 30f;

// polystar array
PolyStar[] polystar = new PolyStar[num_stars];

// randomize stars appearance
void randPolyStar(int i)
{
  polystar[i].mode           = int( random(2));
  polystar[i].starSize       = int( random(20,starMaxSize) );
  polystar[i].starInnerSize  = int( random(12,15) );
  polystar[i].numPoints      = int( random(5,8) );
  polystar[i].r              = int( random(111,254) );
  polystar[i].g              = int( random(128,254) );
  polystar[i].b              = int( random(200,254) );
  polystar[i].swingOffset    = random( 0.0f,width );
  polystar[i].swingScale     = random( 4.0f,8.0f );
  polystar[i].swingSpeed     = random( 0.05f,0.09f );
  polystar[i].spinFactor     = random( -0.02f,0.02f );
  polystar[i].dropRate       = random( 1f,3.0f );
}

// ----------------- //
//       SETUP
// ------------------//

void setup()
{
 size(600,200);
 smooth(1);
 frameRate(48);
 strokeWeight(4);
 strokeCap(ROUND);
 strokeJoin(ROUND);

 for (int i=0; i < polystar.length; i++)
 {
   polystar[i] = new PolyStar();
   polystar[i].x = random( -starMaxSize,width - starMaxSize );
   polystar[i].y = random( -starMaxSize,height - starMaxSize );
   randPolyStar(i);
 }
}

// ----------------- //
//       DRAW
// ------------------//

void draw()
{
 background(100,110,240);

 for (int i = 0; i < polystar.length; i ++ )
 {
  polystar[i].update();
  polystar[i].draw();

  if (polystar[i].y <= -starMaxSize || polystar[i].y > height + starMaxSize)
  {
   polystar[i].y = -starMaxSize;
   randPolyStar(i);
  }
 }
}

// --------------- //
// Poly Star Class
// --------------- //

class PolyStar
{
 // vars
 int mode,starSize, numPoints, starInnerSize, r, g, b, dirX, dirY;
 float x, y, spinTheta, spinFactor, dropRate, fallTheta, swingSpeed, swingOffset, swingScale;
 
 PolyStar()
 {
   // no defaults
 }
 
 
// ----------------- //
//       UPDATE  
// ------------------//
 void update()
 {
  x = swingOffset + sin(fallTheta) * swingScale;
  y += dropRate;
  spinTheta += spinFactor;
  fallTheta += swingSpeed;
 }  
 
 
// ----------------- //
//       DRAW  
// ------------------//
 void draw()
 {
  fill(r,g,b, 128);
  stroke(r,g,b);
  
  // draw stars
  pushMatrix();
   translate(x,y);
   rotate(spinTheta); 
   float radAngle = TWO_PI / numPoints;
   float halfAngle = radAngle / 2.0f;

   if (mode == 1) // filled polygon
   {
    beginShape();
    for ( float theta = 0; theta < TWO_PI; theta = radAngle + theta )
     {
       vertex ( cos(theta) * starSize , sin(theta) * starSize ); // outer
       vertex ( cos(theta + halfAngle) * starInnerSize , sin(theta + halfAngle) * starInnerSize ); // inner
     }
    endShape(CLOSE);
   }
   else // wireframe lines
   {   
   for ( float theta = 0; theta < TWO_PI; theta = radAngle + theta )
    {
      line(
          cos(theta) * starSize, sin(theta) * starSize,
          cos(theta + halfAngle) * starInnerSize, sin(theta + halfAngle) * starInnerSize
      ); // outer 
      line(
          cos(theta - halfAngle) * starInnerSize, sin(theta - halfAngle) * starInnerSize, 
          cos(theta) * starSize, sin(theta) * starSize
      ); // inner
    }
   }
  popMatrix();
 }// end draw
}// end PolyStar
