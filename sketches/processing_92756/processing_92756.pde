
/*--------------------------------------------------------------
 Sketch:  BumpTexturedSphere.pde
  
 Simple examples of procedural bump mapped antialiased sphere.
 Original Author:  Ken Perlin
 see  http://mrl.nyu.edu/~perlin/homepage2006/bumpy/index.html
 and  http://cs.nyu.edu/~phs253/cg/assignment10/Sphere.java
  
 Adapted for OpenProcessing ... 2013-03-12  PG
  
 press 's' to save picture as 'BumpySphere.png'
 press mouse button to change bump mapping and surface color 
 tags: bump mapping, texture, sphere, reflection, noise, surface, 
       tracing, lightning
---------------------------------------------------------------*/

class BumpySphere
{
   // PARAMETERS
   int SURFACETYPES = 4;
   int surfaceType = 0;                        // SURFACE TYPE (0..3)
   int W = 0;
   int H = 0;
   PImage image;
   
   float surfaces[][][] =                      // SURFACES:
   {  // AMBIENT    DIFFUSE     SPECULAR
      {{.2,.2,.2}, {.6,.2,.1}, {.3,.3,.3, 4}}, // BROWN
      {{.2,.2,.2}, {.2,.4,.8}, {.3,.3,.3,20}}, // BLUISH
      {{.2,.2,.2}, {.6,.4,.3}, {.3,.3,.3, 5}}, // PAPERY
      {{.2,.2,.2}, {.3,.6,.2}, {.3,.3,.3, 9}}, // GRASS
   };

   float lights[][][] =                        // LIGHTS
   { // DIRECTION      // COLOR  // SCATTER
     {{.577, .577, .577},{1,1,1} ,{0,0,0}},
     {{-.707,   0,-.707},{0,0,0} ,{.5,.4,.5}},
   };

   // WORKING GLOBAL VARIABLES
   float normal[] = {0,0,0};    // SURFACE NORMAL VECTOR
   float color1[] = {0,0,0};    // SURFACE COLOR VECTOR
   
   BumpySphere(int ww, int hh)  // constructor
   {
       W = ww;
       H = hh;
       //println ("creating BumpySphere: w="+W+"  h="+H);
       image = new PImage(ww,hh);
   }
   
   // SET THE COLOR OF A SINGLE PIXEL
   public void draw() 
   {
    float R = W/2-W/20; // RADIUS OF DISK
    int pix = 0;
    for (int y=0; y < H; y++)
     for (int x=0; x < W; x++)
     {
       // SEE WHETHER PIXEL IS WITHIN THE ANTIALIASED DISK
       float X = x-W/2;    // X RELATIVE TO DISK CENTER
       float Y = H/2-y;    // Y RELATIVE TO DISK CENTER
       
       // IF PIXEL IS IN THE DISK, THEN
       float t = disk(X*X+Y*Y, R);
       if (t > 0) 
       {
         // COMPUTE POINT ON UNIT SPHERE (WHICH IS ALSO THE SURFACE NORMAL)
         normal[0] = X / R;
         normal[1] = Y / R;
         normal[2] = (float)Math.sqrt(1 - normal[0]*normal[0] - normal[1]*normal[1]);

         // SAMPLE THE FUNCTION FOUR TIMES TO GET GRADIENT INFO
         float f0 = f(normal[0]     ,normal[1]     ,normal[2]     ),
               fx = f(normal[0]+.01 ,normal[1]     ,normal[2]     ),
               fy = f(normal[0]     ,normal[1]+.01 ,normal[2]     ),
               fz = f(normal[0]     ,normal[1]     ,normal[2]+.01 );

         // SUBTRACT THE FUNCTION'S GRADIENT FROM THE SURFACE NORMAL
         normal[0] -= (fx - f0) * 200;
         normal[1] -= (fy - f0) * 200;
         normal[2] -= (fz - f0) * 200;
	 normalize(normal);

         float s[][] = surfaces[surfaceType];

	 // START WITH JUST AMBIENT COLOR
         color1[0] = s[0][0];
         color1[1] = s[0][1];
         color1[2] = s[0][2];

         for (int L = 0; L < lights.length; L++)  // ITERATE OVER ALL LIGHTS
         {
            // COMPUTE DIFFUSE AND SPECULAR REFLECTANCE FACTORS
            float spec = specular(normal, lights[L][0], s[2][3]);
            float diff = diffuse (normal, lights[L][0]);

            // SHADE THE PIXEL WITH PHONG ALGORITHM
	    for (int i = 0 ; i < 3 ; i++)
               color1[i] += lights[L][1][i] * (s[1][i]*diff + s[2][i]*spec) + lights[L][2][i]*diff;
         }

	 // CHANGE COLOR TO FIXED POINT AND SET COLORED PIXEL
         t *= 255;
         pixels[pix++] = color(round(t * color1[0])
                              ,round(t * color1[1])
                              ,round(t * color1[2]));
      }
      // IF BACKGROUND, THEN SET BLACK PIXEL
      else pixels[pix++] = color(0);
    }
   }
   // CHOOSE A TYPE OF SPACE FILLING TEXTURE
   float f(float x,float y,float z) 
   {
      switch (surfaceType) {
        case 0:  return  0.03 * snoise(x,y,z, 8);
        case 1:  return  0.01 * stripes(x + 2*turbulence(x,y,z,2), 1.6);
        case 2:  return -0.10 * turbulence(x, y, z, 1)*.5 * turbulence(x, y, z, 1);       
        default: return -0.10 * turbulence(x,y,z, 2);
      }
   }

   // STRIPES TEXTURE (GOOD FOR MAKING MARBLE)
   float stripes(float x, float f) 
   {
      double t = 0.5 + 0.5 * Math.sin(f * 2*Math.PI * x);
      return (float)(t * t - 0.5);
   }

   // TURBULENCE TEXTURE
   float turbulence(float x, float y, float z, float freq) 
   {
      float t = -0.5;
      for ( ; freq <= W/12; freq *= 2)
         t += Math.abs(snoise(x,y,z,freq) / freq);
      return t;
   }

   // NOISE TEXTURE
   float snoise(float x, float y, float z, float freq) 
   {
      float x1, y1, z1;
      freq *= 0.707;
      x1 = 0.707 * (x - z);
      z1 = freq * (x + z);
      y1 = freq * (x1 + y);
      x1 = freq * (x1 - y);
      return noise((x1 + 100)+frameCount*0.1, y1, z1);
   }

   // DIFFUSE REFLECTION
   float diffuse(float normal[], float light[]) 
   {
      return Math.max(0, normal[0]*light[0] + normal[1]*light[1] + normal[2]*light[2]);
   }

   // SPECULAR REFLECTION (SPECIAL CASE, WHERE CAMERA IS ALWAYS IN (0,0,1) DIRECTION)
   float r[] = {0,0,0};
   float specular(float normal[], float light[], float power) 
   {
      r[0] = 2*normal[2]*normal[0];
      r[1] = 2*normal[2]*normal[1];
      r[2] = 2*normal[2]*normal[2] - normal[2];
      return (float)Math.pow(diffuse(r,light),power);
   }

   // COVERAGE OF ONE PIXEL BY A SMOOTH-EDGED DISK
   float disk(float rr, float radius) 
   {
      float dd = rr - radius*radius;
      return dd >= 2*radius ? 0 : dd <= -2*radius ? 1 : (2*radius - dd) / (4*radius);
   }

   // NORMALIZE THE LENGTH OF A VECTOR
   void normalize(float v[]) 
   {
      float norm = (float)Math.sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2]);
      v[0] /= norm;
      v[1] /= norm;
      v[2] /= norm;
   }
   
   // ALLOW AN EXTERNAL CALLER TO SET THE SURFACE TYPE
   void setType(int t) 
   { 
     surfaceType = t % SURFACETYPES; 
     //println ("type="+surfaceType);
   }
}

//--------------------------------------------------------------
BumpySphere planet; 
int iWidth = 0;
int iHeight = 0;
//--------------------------------------------------------------
void setup()
{
  size (300,300);
  noiseDetail(5, 0.5);
}
//--------------------------------------------------------------
void draw()
{
  if ((iWidth != width) || (iHeight != height))
  { // window resizes e.g. because of zooming
    planet = new BumpySphere(width,height);
    iWidth = width;
    iHeight = height;
    println (width + "*" +height);
  }
  background(0);
  loadPixels();
  planet.draw();
  updatePixels();
  text (nf(frameRate,0,1)+" fps", 11,22);
  text (planet.surfaceType+1, 11,44);
}
//--------------------------------------------------------------
void mousePressed()
{
  planet.setType(planet.surfaceType+1);
}
//--------------------------------------------------------------
void keyPressed()
{
  if (key == 's') save("BumpySphere.png");
  // only for testing...
  else if (key == '-') size(width-1,height-1);
  else if (key == '+') size(width+1,height+1);
}

