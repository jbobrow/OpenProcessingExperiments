
final int STAGE_WIDTH = 400;
final int STAGE_HEIGHT = 400;
final int NB_PARTICLES = 15000;
final float MAX_PARTICLE_SPEED = 2.5;
final float PARTICULE_SIZE = 1;
final float MAX_DISTANCE = sqrt(STAGE_WIDTH*STAGE_WIDTH + STAGE_HEIGHT*STAGE_HEIGHT);

final float MIN_STEP_NOISE = 0.004;
final float MAX_STEP_NOISE = 0.01;
final float MIN_SPEED_NOISE = -.02;
final float MAX_SPEED_NOISE = .02;
//'root' of the noise
float noiseXY;
//used to move the noise - or not
float noiseSpeed;
//noise step (the smaller, the better granularity)
float stepNoiseXY;

//influence circle of the mouse
final float MAX_DIST_MOUSE_SQUARE = 550;
final float MAX_DIST_MOUSE = sqrt(MAX_DIST_MOUSE_SQUARE);
myVector tabParticles[];//array of particles
Boolean mouseRepels = false;//allows the mouse to repel the particles

float coeffColor;


void setup()
{
  size(400, 400, P3D);
  background(0);
  initialize();
}

void initialize()
{
  float n;
  noiseXY = noiseXY = random(123456);
  noiseSpeed = random(MIN_SPEED_NOISE, MAX_SPEED_NOISE);
  coeffColor = random(3);
  stepNoiseXY = random(MIN_STEP_NOISE, MAX_STEP_NOISE);
  tabParticles = new myVector[NB_PARTICLES];
  for (int i = 0; i < NB_PARTICLES; i++)
  {
    tabParticles[i] = new myVector(random(STAGE_WIDTH), random(STAGE_HEIGHT));
    tabParticles[i].prevX = tabParticles[i].x;
    tabParticles[i].prevY = tabParticles[i].y;
    n = noise(noiseXY+tabParticles[i].x*stepNoiseXY, noiseXY+tabParticles[i].y*stepNoiseXY);
    tabParticles[i].myColor = color((255-n*255)*coeffColor, 255-n*126*coeffColor, 255*n*coeffColor);
  }
}

void draw()
{
  fill(0, 15);
  noStroke(); 
  rect(0, 0, width, height);

  noiseXY += noiseSpeed;
  float n;
  float distMouse;
  float vx;
  float vy;
  float dx;
  float dy;
  PVector mouseVector = new PVector(mouseX, mouseY);
  for (int i = 0; i < NB_PARTICLES; i++)
  {
    fill(tabParticles[i].myColor);
    tabParticles[i].prevX = tabParticles[i].x;
    tabParticles[i].prevY = tabParticles[i].y;

    n = noise(noiseXY+tabParticles[i].x*stepNoiseXY, noiseXY+tabParticles[i].y*stepNoiseXY);

    vx = (1-n)*2*cos(n * TWO_PI)*MAX_PARTICLE_SPEED;
    vy = (1-n)*2*sin(n * TWO_PI)*MAX_PARTICLE_SPEED;

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

    if ((tabParticles[i].x < 0) || (tabParticles[i].x > STAGE_WIDTH) || 
      (tabParticles[i].y < 0) || (tabParticles[i].y > STAGE_HEIGHT))
    {
      //prevents from reappearing inside the mouse influence
      float theta = random(TWO_PI);
      tabParticles[i].x = tabParticles[i].prevX = mouseX + random(mouseRepels ? MAX_DIST_MOUSE : 0, MAX_DISTANCE)*cos(theta);
      tabParticles[i].y = tabParticles[i].prevY = mouseY + random(mouseRepels ? MAX_DIST_MOUSE : 0, MAX_DISTANCE)*sin(theta);
      n = noise(noiseXY+tabParticles[i].x*stepNoiseXY, noiseXY+tabParticles[i].y*stepNoiseXY);
      tabParticles[i].myColor = color((255-n*255)*coeffColor, 255-n*126*coeffColor, 255*n*coeffColor);
    }

    //tabParticles[i].myColor = color(200-n*255, 255-n*255, 255*n/2);
    strokeWeight(sqrt(vx*vx + vy*vy)*n*1.5);
    stroke(tabParticles[i].myColor, 40);
    //stroke(vx * 255, vy * 255, tabParticles[i].x * 100, 40);
    //draws a line between the two consecutive positions of the particle
    line(tabParticles[i].prevX, tabParticles[i].prevY, tabParticles[i].x, tabParticles[i].y);
  }
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    initialize();
  }
  else if (mouseButton == RIGHT)
  {
    mouseRepels = true;
  }
}

void mouseReleased() {  
  mouseRepels = false;
}

class myVector extends PVector
{
  myVector (float p_x, float p_y) {
    super(p_x, p_y);
  }
  float prevX;
  float prevY;
  color myColor;
}


