
/*  ====================================
             POINT TUNNEL DEMO
    ====================================
      (c) Deinyon "ddoodm" Davies 2013
              www.DDOODM.com
     
       AUTHOR...........: DDOODM
       REVISION.........: 27/NOV/13
       TOOLCHAIN........: JDK 1.7
       
   NOTE:
     Point ring children are transformed
   relative to their parents, so
   translation is multiplied as the
   tunnel moves into Z-space.
*/

final short  ELLIPSE_RES = 25;
PVector[]    points  = new PVector[ELLIPSE_RES];  // Array of vertices that compose an ellipse
float        speed = 0.02, amp = 512;
int          hw, hh;                              // Half-width and half-height

void setup()
{
  size(1024,640,P3D); // OpenGL for 3D transforms
  colorMode(HSB);        // Easy hue ramp
  
  //background(0);
  strokeWeight(6);
  noiseSeed(second()+day());
  noiseDetail(2,0.5);
  init_points();
  
  hw = width/2; hh = height/2;
}

// Calculate coordinates for each ellipse vector
void init_points()
{
  for(int i=0; i<ELLIPSE_RES; i++)
    points[i] = new PVector(
      width/2*sin((float)i/ELLIPSE_RES * TWO_PI),
      height/2*cos((float)i/ELLIPSE_RES * TWO_PI));
}

void draw()
{
  //trailingBG(); // Unsupported
  background(0);
  
  translate(width/2, height/2, 255);  // Center and zoom
  
  float transx, transy, firstx, firsty, idist;
  for(int z=0; z<16; z++)
  {
    idist = 255-(float)z/25*255;
    stroke(((frameCount*16+z*16)/2)%255, 128, idist);
    
    transx = amp*0.35-noise(float(z+frameCount)*speed)*amp;
    transy = amp*0.35-noise(transx*speed,float(z+frameCount)*speed)*amp;
    
    translate(0,0,-200);
//  rotateZ((float)mouseX/width*0.05 -0.025);
    translate(transx,transy);
    drawEllipse();
  }
}

// Simple motion-blur by drawing a semi-transparent
// rectangle over the last display buffer
void trailingBG()
{
  hint(DISABLE_DEPTH_TEST);
  colorMode(RGB);
  fill(0,0x50);
  rect(0,0,width,height);
  colorMode(HSB);
  hint(ENABLE_DEPTH_TEST);
}

// Plot precalculated ellipse
void drawEllipse()
{
  for(int i=0;i<ELLIPSE_RES;i++)
    point(points[i].x, points[i].y);
}
