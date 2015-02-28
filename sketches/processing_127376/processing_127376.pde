

final int STAGE_WIDTH = 600;
final int STAGE_HEIGHT = 500;
final int NB_POINTS = 15000;
final float FINAL_SPHERE_RADIUS = 800;
final float NOISE_SPHERE_RADIUS = 100;
final float MAX_SPEED_NOISE = 0.025;
final float MIN_FREQ_NOISE = 50;
final float MAX_FREQ_NOISE = 300;

final float GOLDEN_RATIO = (sqrt(5)+1)/2 - 1;
final float GOLDEN_ANGLE = GOLDEN_RATIO*TWO_PI;

float minSphereRadius = 10;//random(FINAL_SPHERE_RADIUS);
float zoom = .3;
float rotX = 0;
float rotY = 0;
float h;
float noiseX = 0;
float noiseY = 0;
float noiseZ = 0;
float noiseSpeedX = random(MAX_SPEED_NOISE);
float noiseSpeedY = random(MAX_SPEED_NOISE);
float noiseSpeedZ = random(MAX_SPEED_NOISE);
float noiseFreqX = random(MIN_FREQ_NOISE, MAX_FREQ_NOISE);
float noiseFreqY = random(MIN_FREQ_NOISE, MAX_FREQ_NOISE);
float noiseFreqZ = random(MIN_FREQ_NOISE, MAX_FREQ_NOISE);
myVector tabNoise[];


void setup()
{
  size(600, 500, P3D);
  background(0);
  noStroke();
  initialize();
}

void initialize()
{
  int myX, myY, myZ;
  tabNoise = new myVector[NB_POINTS];
  for (int i = 1; i < NB_POINTS; ++i)
  {
    float longitude = GOLDEN_ANGLE*i;
    longitude /= TWO_PI; 
    longitude -= floor(longitude);
    longitude *= TWO_PI;
    if (longitude > PI) 
    {
      longitude -= TWO_PI;
    }
    float latitude = asin(-1 + 2*i/(float)NB_POINTS);

    myX = (int)(NOISE_SPHERE_RADIUS * cos(latitude) * cos(longitude));
    myY = (int)(NOISE_SPHERE_RADIUS * cos(latitude) * sin(longitude));
    myZ = (int)(NOISE_SPHERE_RADIUS * sin(latitude));

    tabNoise[i] = new myVector(myX, myY, myZ);
    tabNoise[i].latitude = latitude;
    tabNoise[i].longitude = longitude;
  }
}

void draw()
{
  background(0);
  scale(zoom);
  translate(width/2/zoom, height/2/zoom);
  float rotateY = mouseX * TWO_PI / STAGE_WIDTH;
  float rotateX = mouseY * TWO_PI / STAGE_HEIGHT;
  rotateY(rotateY);
  rotateX(rotateX);

  noiseX += noiseSpeedX;
  noiseY += noiseSpeedY;
  noiseZ += noiseSpeedZ;

  float n;
  float myX, myY, myZ;
  float myAlpha = 255;
  myVector prevPoint = new myVector(0, 0, 0);
  for (int i = 1; i < NB_POINTS; ++i)
  {
    n = noise(tabNoise[i].x/noiseFreqX+noiseX, tabNoise[i].y/noiseFreqY+noiseY, tabNoise[i].z/noiseFreqZ+noiseZ);
/*
    if (sin(tabNoise[i].longitude + rotateY) < 0)
      //if(cos(tabNoise[i].latitude) > 0)
    {
      myAlpha = 255;
      stroke(n*255, 255-n*255, 255-n*255, myAlpha);
    }
    else
    {
      myAlpha = 150;
      stroke(255, myAlpha);
    }
    */
    stroke(n*255, 255-n*255, 255-n*255, 255);

    pushMatrix();
    rotateY(tabNoise[i].longitude);
    rotateZ(-tabNoise[i].latitude);
    point(minSphereRadius + n*(FINAL_SPHERE_RADIUS-minSphereRadius), 0, 0);
    popMatrix();
  }
}

void mousePressed()
{
  minSphereRadius = 10;//random(FINAL_SPHERE_RADIUS);
  noiseSpeedX = random(MAX_SPEED_NOISE);
  noiseSpeedY = random(MAX_SPEED_NOISE);
  noiseSpeedZ = random(MAX_SPEED_NOISE);
  noiseFreqX = random(MIN_FREQ_NOISE, MAX_FREQ_NOISE);
  noiseFreqY = random(MIN_FREQ_NOISE, MAX_FREQ_NOISE);
  noiseFreqZ = random(MIN_FREQ_NOISE, MAX_FREQ_NOISE);
}


class myVector extends PVector
{
  myVector (float p_x, float p_y, float p_h) {
    super(p_x, p_y, p_h);
  }
  float longitude;
  float latitude;
}


