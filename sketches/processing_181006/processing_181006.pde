
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/41142*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/**
 * A fast method for getting an arbitrary number of equidistant points on a sphere.
 * Draws a fibonacci spiral down from the pole, which maintains uniform surface area.
 *
 * Click to toggle point adding.
 *
 * Original with points Jim Bumgardner 10/6/2011
 * Variation with cubes Martin Prout 19/7/2013 
 */

float radius = 277;

float rotationX = 0;
float rotationY = 0;
float velocityX = 0;
float velocityY = 0;
float pushBack = 0;

float PHI = (sqrt(5)+1)/2 - 1;     // golden ratio
float GA = PHI * TWO_PI;           // golden angle

int KMAX_POINTS = 1000;

int nbrPoints = 1000;

// To add: Give each point a heading and velocity, adjust based on distance/heading to nearby points.
//

class SpherePoint {
  float  lat,lon;
  SpherePoint(float lat, float lon)
  {
    this.lat = lat;
    this.lon = lon;
  }
};

SpherePoint[] pts = new SpherePoint[KMAX_POINTS];

boolean addPoints = true;

void initSphere(int num)
{
  for (int i = 1; i <= num; ++i) {
    float lon = GA*i;
    lon /= TWO_PI; 
    lon -= floor(lon); 
    lon *= TWO_PI; 
    if (lon > PI){lon -= TWO_PI;}

    // Convert dome height (which is proportional to surface area) to latitude
    float lat = asin(-1 + 2*i/(float)num);

    pts[i] = new SpherePoint(lat, lon);
  }
}

void setup()
{
  size(1024, 768, P3D);  
  radius = 0.8 * height/2;  
  initSphere(nbrPoints);
  background(0);
}

void draw()
{    
  if (addPoints) {
    nbrPoints += 1;
    nbrPoints = min(nbrPoints, KMAX_POINTS);
    initSphere(nbrPoints);
  }

  background(0);            
  lights();
  ambient(200, 10, 10);
  ambientLight(150, 150, 150);
  renderGlobe(); 

  // Implements mouse control (interaction will be inverse when sphere is  upside down)



  rotationX += velocityX;
  rotationY += velocityY;
  velocityX *= 0.95;
  velocityY *= 0.95;
  
    if(mousePressed){
    velocityX += (mouseY-pmouseY) * 0.01;
    velocityY -= (mouseX-pmouseX) * 0.01;
  }
  
  }




void renderGlobe() 
{
  pushMatrix();
  translate(width/2.0, height/2.0, pushBack);
  
  float xradiusot = radians(-rotationX);
  float yradiusot = radians(270 - rotationY - millis()*.01);
  rotateX( xradiusot );  
  rotateY( yradiusot );
  float elapsed = millis()*0.001;
  float secs = floor(elapsed);
  
  for (int i = 1; i <= min(nbrPoints,pts.length); ++i)
  {
      float lat = pts[i].lat; 
      float lon = pts[i].lon;

      pushMatrix();
      rotateY(lon);
      rotateZ(-lat);
      rotateX(40);

      fill(200, 10, 10);
      translate(radius, 0, 0);
      box(2, 32, 32);
      
      popMatrix();
  }

  popMatrix();
  
}

