
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/127376*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

// sketch: terrainSphereNoise3    v1.0
// You can move the mouse to 3D-rotate the sphere.
// Click to generate a new blob! 
// press p for pause
//   s to save picture      
//   f to toggle frequency display      
//  +/- change dot size
// tags:  3d, noise, fibonacci, sphere, animation

final int NB_POINTS = 5000;
final float FINAL_SPHERE_RADIUS = 300;
final float SPHERE_RADIUS = 50;
final float MAX_SPEED_NOISE = 0.025;
final float MIN_FREQ_NOISE = 50;
final float MAX_FREQ_NOISE = 300;
final float GOLDEN_RATIO = (sqrt(5)+1)/2 - 1;
final int DOT_ALPHA = 16;

float minSphereRadius = 10;//random(FINAL_SPHERE_RADIUS);
float centerX = 300.0;
float centerY = 300.0;
float rotX = 0;
float rotY = 0;
float dotSize = 20;
PVector noise = new PVector();
PVector noiseSpeed = new PVector();
PVector noiseFreq = new PVector();
boolean isPaused = false;
boolean showFPS = false;
myVector dots[];

void setup()
{
  size(600, 600, P3D);
  background(0);
  noStroke();
  centerX = width / 2;
  centerY = height / 2;
  randomizeScene();
  initializeDots();
  frameRate(30);
  hint(DISABLE_DEPTH_TEST);
}

void randomizeScene()
{
  //minSphereRadius = random(10, 20);
  noiseSpeed.x = random(MAX_SPEED_NOISE);
  noiseSpeed.y = random(MAX_SPEED_NOISE);
  noiseSpeed.z = random(MAX_SPEED_NOISE);
  noiseFreq.x = random(MIN_FREQ_NOISE, MAX_FREQ_NOISE);
  noiseFreq.y = random(MIN_FREQ_NOISE, MAX_FREQ_NOISE);
  noiseFreq.z = random(MIN_FREQ_NOISE, MAX_FREQ_NOISE);
}

// create fibonacci sphere points with SPHERE_RADIUS
void initializeDots()
{
  dots = new myVector[NB_POINTS];
  for (int ni = 1; ni < NB_POINTS; ni++)
  {
    float longitude = GOLDEN_RATIO * ni;
    longitude -= floor(longitude);
    longitude *= TWO_PI;
    float latitude = asin(-1.0 + 2.0 * ni / NB_POINTS);
    dots[ni] = new myVector (
      SPHERE_RADIUS * cos(latitude) * cos(longitude),
      SPHERE_RADIUS * cos(latitude) * sin(longitude),
      SPHERE_RADIUS * sin(latitude));
    dots[ni].latitude = latitude;
    dots[ni].longitude = longitude;
  }
}

void draw()
{
  background(0);
  if (showFPS)
    text(round(frameRate), 10,20);
  strokeWeight(dotSize);
  translate(centerX, centerY);
  float rotateY = mouseX * TWO_PI / width;
  float rotateX = mouseY * TWO_PI / height;
  rotateY(rotateY);
  rotateX(rotateX);
  if (!isPaused)
    noise.add(noiseSpeed);
  float px, py, pz, nv;
  PVector p = new PVector();
  for (int ni = 1; ni < NB_POINTS; ++ni)
  {
    p.x = dots[ni].x / noiseFreq.x;
    p.y = dots[ni].y / noiseFreq.y;
    p.z = dots[ni].z / noiseFreq.z;
    nv = noise(p.x +noise.x, p.y +noise.y, p.z +noise.z);
    stroke(abs(p.x*555), abs(p.y*555), abs(p.z*555), DOT_ALPHA);
    pushMatrix();
      rotateY(dots[ni].longitude);
      rotateZ(-dots[ni].latitude);
      point(minSphereRadius +  nv * FINAL_SPHERE_RADIUS, 0, 0);
    popMatrix();
  }
}

class myVector extends PVector
{
  myVector (float p_x, float p_y, float p_h) 
  {
    super(p_x, p_y, p_h);
  }
  float longitude;
  float latitude;
}

void mousePressed()
{
  randomizeScene();
}

void keyPressed()
{
  if      (key == 's')  save("terrainSphereNoise.png");
  else if (key == '+')  dotSize += 0.2;
  else if (key == '-')  dotSize -= 0.2;
  else if (key == 'f')  showFPS = !showFPS;
  else isPaused = !isPaused;
}


