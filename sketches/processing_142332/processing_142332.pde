
final int NB_PARTICLES = 15000;
final float MAX_PARTICLE_SPEED = 2.5;
final float PARTICULE_SIZE = 1;

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

float coeffColor;
int R;
int nbSymetries = 12;
PGraphics myPg;

float h, l, d, theta;
float rot = 0;
PVector s = new PVector(random(0), random(0));
PVector c;
PVector[] p = new PVector[4];
float rotSpeed = random(.002, .03);

void setup()
{
  size(500, 500, P3D);
  background(0);
  initialize();
}

void initialize()
{
  float n;
  noiseXY = noiseXY = random(123456);
  noiseSpeed = random(MIN_SPEED_NOISE, MAX_SPEED_NOISE);
  coeffColor = random(.7, 2.3);
  println("coeffColor: " + coeffColor);
  stepNoiseXY = random(MIN_STEP_NOISE, MAX_STEP_NOISE);
  tabParticles = new myVector[NB_PARTICLES];
  for (int i = 0; i < NB_PARTICLES; i++)
  {
    tabParticles[i] = new myVector(random(width), random(height));
    tabParticles[i].prevX = tabParticles[i].x;
    tabParticles[i].prevY = tabParticles[i].y;
    n = noise(noiseXY+tabParticles[i].x*stepNoiseXY, noiseXY+tabParticles[i].y*stepNoiseXY);
    tabParticles[i].myColor = color((255-n*255)*coeffColor, 255-n*126*coeffColor, 255*n*coeffColor);
  }

  R = min(height, width)/2;
  myPg = createGraphics(width, height, P2D);

  theta = TWO_PI / nbSymetries;
  l = R*cos(theta/2);
  h = R*sin(theta/2);
  for (int i = 0; i < 4; i++)
  {
    p[i] = new PVector(width/2, height/2);
  }
  c = new PVector(width/2, height/2);
  d = sqrt(l*l + h*h);
}

void draw()
{
  background(0);
  
  //nbSymetries = int(map(mouseX, 0, width, 2, 20))*2;
  myPg.fill(0, 15);
  myPg.noStroke(); 
  myPg.rect(0, 0, width, height);
  
  
  noiseXY += noiseSpeed;
  float n, vx, vy, dx, dy, distMouse;
  PVector mouseVector = new PVector(mouseX, mouseY);
  myPg.beginDraw();
  for (int i = 0; i < NB_PARTICLES; i++)
  {
    myPg.fill(tabParticles[i].myColor);
    tabParticles[i].prevX = tabParticles[i].x;
    tabParticles[i].prevY = tabParticles[i].y;

    n = noise(noiseXY+tabParticles[i].x*stepNoiseXY, noiseXY+tabParticles[i].y*stepNoiseXY);

    vx = (1-n)*2*cos(n * TWO_PI)*MAX_PARTICLE_SPEED;
    vy = (1-n)*2*sin(n * TWO_PI)*MAX_PARTICLE_SPEED;

    dx = mouseX - tabParticles[i].x; 
    dy = mouseY - tabParticles[i].y;
    distMouse = dx*dx+dy*dy;

    vx = constrain(vx, -MAX_PARTICLE_SPEED, MAX_PARTICLE_SPEED);
    vy = constrain(vy, -MAX_PARTICLE_SPEED, MAX_PARTICLE_SPEED);

    tabParticles[i].x += vx;
    tabParticles[i].y += vy;

    if ((tabParticles[i].x < 0) || (tabParticles[i].x > width) || 
      (tabParticles[i].y < 0) || (tabParticles[i].y > height))
    {
      float myX = random(width);
      float myY = random(height);

      tabParticles[i].x = tabParticles[i].prevX = myX;
      tabParticles[i].y = tabParticles[i].prevY = myY;
    }
    tabParticles[i].myColor = color((255-n*255)*coeffColor, 255-n*126*coeffColor, 255*n*coeffColor);
    //tabParticles[i].myColor = color(200-n*255, 255-n*255, 255*n/2);
    myPg.strokeWeight(sqrt(vx*vx + vy*vy)*n*1.5);
    myPg.stroke(tabParticles[i].myColor, 40);

    myPg.line(tabParticles[i].prevX, tabParticles[i].prevY, tabParticles[i].x, tabParticles[i].y);
  }
  myPg.endDraw();

  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  rot += rotSpeed;
  c.add(s);

  float angle1 = theta - rot;
  float angle2 = theta + rot;

  p[0] = new PVector(c.x - d/2 * cos(angle2), c.y - d/2 * sin(angle2));
  p[1] = new PVector(c.x + d/2 * cos(angle1), c.y - d/2 * sin(angle1));
  p[2] = new PVector(c.x + d/2 * cos(angle2), c.y + d/2 * sin(angle2));
  p[3] = new PVector(c.x - d/2 * cos(angle1), c.y + d/2 * sin(angle1));

  Boolean found = false;
  for (int i = 0; i < 4 && found == false; i++)
  {
    if (p[i].x > width || p[i].x < 0)
    { 
      s.x *= -1;
      found = true;
    }
    if (p[i].y > height || p[i].y < 0)
    { 
      s.y *= -1;
      found = true;
    }
  }
  if (found) rotSpeed = -rotSpeed;
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////

  translate(width/2, height/2);
  beginShape(TRIANGLES);
  texture(myPg);
  noStroke();
  for (int i = 0; i < nbSymetries; i++)
  {
    vertex(0, 0, (p[0].x+p[3].x)/2, (p[0].y+p[3].y)/2);
    vertex(R*cos(i*TWO_PI/nbSymetries), R*sin(i*TWO_PI/nbSymetries), (i%2 == 0) ? p[1].x : p[2].x, (i%2 == 0) ? p[1].y : p[2].y);
    vertex(R*cos((i+1)*TWO_PI/nbSymetries), R*sin((i+1)*TWO_PI/nbSymetries), (i%2 == 0) ? p[2].x : p[1].x, (i%2 == 0) ? p[2].y : p[1].y);
  }
  endShape();
  
  /*
  translate(-width/2, -height/2);
  fill(255);
  beginShape();
  for (int i = 0; i < 4; i++)
  {
    vertex(p[i].x, p[i].y);
  }
  endShape();
  fill(50);
  beginShape();
  vertex((p[0].x+p[3].x)/2, (p[0].y+p[3].y)/2);
  //vertex(p[0].x, p[0].y);
  vertex(p[1].x, p[1].y);
  vertex(p[2].x, p[2].y);
  endShape();
  */
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    initialize();
  }else if (mouseButton == RIGHT)
  {
    rotSpeed = rotSpeed == 0 ? random(.002, .03) : 0;
    println(rotSpeed);
  }
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


