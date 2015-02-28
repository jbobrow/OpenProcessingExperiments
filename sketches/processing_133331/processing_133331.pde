
final int STAGE_WIDTH = 640;
final int STAGE_HEIGHT = 512;
final int NB_PARTICLES = 20000;
final float MAX_PARTICLE_SPEED = 2.5;
final float PARTICULE_SIZE = 1;
final float MAX_DISTANCE = sqrt(STAGE_WIDTH*STAGE_WIDTH + STAGE_HEIGHT*STAGE_HEIGHT);

final float MIN_STEP_NOISE = 0.001;
final float MAX_STEP_NOISE = 0.004;//0.01;
final float MIN_SPEED_NOISE = -.03;
final float MAX_SPEED_NOISE = .03;
final int MIN_LIFE_TIME = 10;
final int MAX_LIFE_TIME = 40;

//'root' of the noise
float noiseX;
float noiseY;
//used to move the noise - or not
float noiseSpeedX;
float noiseSpeedY;
//noise step (the smaller, the better granularity)
float stepNoiseX;
float stepNoiseY;

//influence circle of the mouse
final float MAX_DIST_MOUSE_SQUARE = 550;
final float MAX_DIST_MOUSE = sqrt(MAX_DIST_MOUSE_SQUARE);
myVector tabParticles[];//array of particles
Boolean mouseRepels = false;//allows the mouse to repel the particles

//picture
final String IMAGE_PATH = "landscape.jpg";//landscape nature lao
PImage myImage;
int imageW;
int imageH;
color myPixels[];

float coeffColor;


void setup()
{
  size(640, 512, P3D);
  background(0);
  initializeImage();
  initializeNoise();
  myImage.updatePixels();
}

void initializeImage()
{
  myImage = loadImage(IMAGE_PATH);
  imageW = myImage.width;
  imageH = myImage.height;
  myPixels = new color[imageW * imageH];
  myImage.loadPixels();
  myPixels = myImage.pixels;
  myImage.updatePixels();
}

void initializeNoise()
{
  int myX;
  int myY;
  noiseX = random(123456);
  noiseY = random(123456);
  noiseSpeedX = random(MIN_SPEED_NOISE, MAX_SPEED_NOISE);
  noiseSpeedY = random(MIN_SPEED_NOISE, MAX_SPEED_NOISE);
  stepNoiseX = random(MIN_STEP_NOISE, MAX_STEP_NOISE);
  stepNoiseY = random(MIN_STEP_NOISE, MAX_STEP_NOISE);
  tabParticles = new myVector[NB_PARTICLES];
  for (int i = 0; i < NB_PARTICLES; i++)
  {
    myX = (int)random(imageW);
    myY = (int)random(imageH);
    tabParticles[i] = new myVector(myX, myY);
    tabParticles[i].prevX = tabParticles[i].x;
    tabParticles[i].prevY = tabParticles[i].y;
    tabParticles[i].count = (int)random(MIN_LIFE_TIME, MAX_LIFE_TIME);
    tabParticles[i].myColor = myPixels[(int)(tabParticles[i].y)*imageW + (int)(tabParticles[i].x)];
  }
}

void draw()
{
  fill(0, 2);
  noStroke(); 
  rect(0, 0, width, height);

  noiseX += noiseSpeedX;
  noiseY += noiseSpeedY;
  float n;
  float distMouse;
  float vx;
  float vy;
  float dx;
  float dy;
  PVector mouseVector = new PVector(mouseX, mouseY);
  for (int i = 0; i < NB_PARTICLES; i++)
  {
    tabParticles[i].prevX = tabParticles[i].x;
    tabParticles[i].prevY = tabParticles[i].y;

    n = noise(noiseX+tabParticles[i].x*stepNoiseX, noiseY+tabParticles[i].y*stepNoiseY);

    vx = (n-1)*2*cos((n-.6) * TWO_PI)*MAX_PARTICLE_SPEED;
    vy = (n-1)*2*sin(n * TWO_PI)*MAX_PARTICLE_SPEED;

    dx = mouseX - tabParticles[i].x; 
    dy = mouseY - tabParticles[i].y;
    distMouse = dx*dx+dy*dy;
    if (mouseRepels && (distMouse < MAX_DIST_MOUSE_SQUARE))
    {
      distMouse = sqrt(distMouse);
      float f = MAX_DIST_MOUSE / distMouse;
      vx -= f*dx; 
      vy -= f*dy;
    }
    vx = constrain(vx, -MAX_PARTICLE_SPEED, MAX_PARTICLE_SPEED);
    vy = constrain(vy, -MAX_PARTICLE_SPEED, MAX_PARTICLE_SPEED);

    tabParticles[i].x += vx;
    tabParticles[i].y += vy;
    tabParticles[i].count++;
    if ((tabParticles[i].x < 0) || (tabParticles[i].x > imageW-1) || 
      (tabParticles[i].y < 0) || (tabParticles[i].y > imageH-1) ||
      tabParticles[i].count > MAX_LIFE_TIME)
    {
      float myX = 0;
      float myY = 0;
      //prevents from reappearing inside the mouse influence
      if (mouseRepels)
      {
        Boolean isFound = false;
        while (!isFound)
        {
          myX = random(imageW);
          myY = random(imageH);
          dx = mouseX - myX;
          dy = mouseY - myY;
          if (dx*dx + dy*dy > MAX_DIST_MOUSE_SQUARE)
          {
            isFound = true;
          }
        }
      }
      else
      {
        myX = random(imageW);
        myY = random(imageH);
      }
      tabParticles[i].x = tabParticles[i].prevX = myX;
      tabParticles[i].y = tabParticles[i].prevY = myY;
      tabParticles[i].count = (int)random(MIN_LIFE_TIME, MAX_LIFE_TIME);
      n = noise(noiseX+myX*stepNoiseX, noiseY+myY*stepNoiseY);
      tabParticles[i].myColor = myPixels[(int)(tabParticles[i].y)*imageW + (int)(tabParticles[i].x)];
    }
    strokeWeight(sqrt(vx*vx + vy*vy)*n*1.5);
    stroke(tabParticles[i].myColor, 150);
    line(tabParticles[i].prevX, tabParticles[i].prevY, tabParticles[i].x, tabParticles[i].y);
  }
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    initializeNoise();
  }
  else if (mouseButton == RIGHT)
  {
    mouseRepels = true;
  }
}

void mouseReleased()
{  
  mouseRepels = false;
}

class myVector extends PVector
{
  myVector (float p_x, float p_y)
  {
    super(p_x, p_y);
  }
  float prevX;
  float prevY;
  int count;
  color myColor;
}


