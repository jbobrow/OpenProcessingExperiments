

//==========================================================
// sketch:  PG_SphereTracer1.pde - by Gerd Platl
// info:    Simple raytracing of a colored sphere 
//          with transparent atmosphere which has an other color.
// note:    Many Raytracer decide if the ray hits the sphere or not.
//          Expensive antialising calculation is done afterwards.
//          With this algorithm the a sphere intersection
//          and the atmosphere transparence is calculated in one step.
//          This sketch is only showing the basic effect.
//          Sphere coloring and reflection ray calculation 
//          has to be added for better results. 
// date:    v1.0  2012-11-26  initial release
//          v1.1  2013-03-17  corrected resizing
// tags:    sphere, halo, generator, antialiasing, raytracing
// input:   press <blanc> to create a random planet
//==========================================================
PImage loadedImage, backImage;
PImage planetImage;
PVector rayOrigin = new PVector(0, 0, 1000);
PVector rayDir = new PVector(0, 0, -1000);
PVector sphereCenter = new PVector(0, 0, 0);
color haloColor = color(255, 66, 44);
color planetColor = color(222, 222, 88);
int imageSize = 300;
//----------------------------------------------------------
void setup() 
{
  size(640, 480);
  loadedImage = loadImage("Space.jpg");
  planetImage = new PImage(imageSize, imageSize, ARGB);
  drawPlanet(80, 80);
  frameRate(200);  // only for testing
}
//----------------------------------------------------------
void draw()
{
  checkResizing();
  background(backImage);
  image (planetImage, 80+120*sin(frameCount*0.01), 0);
  text (round(frameRate)+ " fps", 10, 20);
}
//----------------------------------------------------------
int iWidth = 0;
int iHeight = 0;
//----------------------------------------------------------
void checkResizing()
{
  if ((iWidth != width) || (iHeight != height))
  { // window size changes e.g. because of browser zooming
    image(loadedImage, 0, 0, width, height);  // resize to screen
    backImage = get();                        // get from screen
    iWidth = width;
    iHeight = height;
    //println (width + "*" +height);
  }
}
//----------------------------------------------------------
// draw new planet to planetImage
//----------------------------------------------------------
void drawPlanet(float sphereRadius, float haloScale)
{
  println("DrawPlanet: r="+round(sphereRadius)+" hs="+round(haloScale));
  float v = 0.0;
  float haloValue =  1 / sq(haloScale);
  color sColor;
  int pixelOffset = 0;
  planetImage.loadPixels();
  for (int yi = 0; yi < planetImage.height; yi++)
    for (int xi = 0; xi < planetImage.width; xi++)
    {
      rayDir.set(xi-150, yi-150, 1000);
      v = raySphereIntersectionValue(sphereRadius);
      v = constrain (1.0+(haloValue*v), -1.0, 1.0);
      // if v < 0 --> distance is out of halo
      if (v < 0.0)
        planetImage.pixels[pixelOffset++] = color(0,0);
      else 
      {
        sColor = lerpColor(haloColor, planetColor, sq(v));
        planetImage.pixels[pixelOffset++] = lerpColor(0, sColor, v);
      }
    }
  planetImage.updatePixels();
}
//----------------------------------------------------------
float raySphereIntersectionValue (float radius) 
{
  rayDir.normalize();                                // rd=g/|g|
  PVector h = PVector.sub(sphereCenter, rayOrigin);  // h=ro-M
  float lf = rayDir.dot(h);                          // lf=rd.h
  return sq(radius)-h.dot(h)+sq(lf);          // s=r^2-h^2+lf^2
}
//----------------------------------------------------------
void createRandomPlanet()
{
  haloColor = color(random(255), random(255), random(255));
  planetColor = color(random(255), random(255), random(255));
  drawPlanet (20+random(120), random (40, 80));
}
//----------------------------------------------------------
void keyPressed() 
{ 
  if (key == 's') save("SphereTracer1.png");
  else createRandomPlanet();
} 
//----------------------------------------------------------
void mousePressed() 
{ 
  createRandomPlanet();
} 


