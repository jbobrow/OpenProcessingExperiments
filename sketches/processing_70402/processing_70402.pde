

PImage help;

Particle[] particles;
int[][] occupancyMap;

boolean drawLines = false;
boolean motionBlur = false;
boolean showHelp = true;
int particleCount = 15000;
int blurAmount = 18;
float transparency = 255;

void setup()
{
  size(800, 600, P2D);
  frameRate(300);
  background(0);
  
  help = loadImage("Help.png");
  spawnParticles();
}

void spawnParticles()
{
  particles = new Particle[particleCount];
  occupancyMap = new int[width][height];
  for(int i = 0; i < particleCount; i++)
    particles[i] = new Particle(random(width), random(height - 30), i);
  
  for(int x = 0; x < width; x++)
  {
    for(int y = 0; y < height; y++)
    {
      occupancyMap[x][y] = -1;
    }
  }
}

void keyReleased()
{
  if(key == 'H' || key == 'h')
    showHelp = !showHelp;
}

void draw()
{
  if(motionBlur)
  {
    noStroke();
    fill(0, 255 * norm(20 - blurAmount, 0, 20));
    rect(0, 0, width, height - 30);
    stroke(255, transparency);
  }
  else
  {
    noStroke();
    fill(0);
    rect(0, 0, width, height - 30);
    stroke(255, transparency);
  }
  
  for(int i = 0; i < particles.length; i++)
  {
    particles[i].update();
    if(!drawLines)
      particles[i].render();
  }
  
  noStroke();
  fill(50);
  rect(0, height - 30, width, 30);
  stroke(255, transparency);
  
  drawGui();
  if(showHelp)
  {
    fill(0);
    rect(0, 0, width, height - 30);
    image(help, 0, height - 135);
  }
}

class Particle
{
  PVector position;
  PVector velocity;
  int id;
  
  protected Particle(float x, float y, int i)
  {
    position = new PVector(x, y);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    id = i;
  }
  
  public void update()
  {
    occupancyMap[floor(position.x)][floor(position.y)] = -1;
    this.updateVelocity();
    velocity.x = constrain(velocity.x, -5, 5);
    velocity.y = constrain(velocity.y, -5, 5);
    position.x += velocity.x;
    position.y += velocity.y;
    if(position.x > width - 1)
      position.x -= width - 1;
    else if(position.x < 0)
      position.x += width - 1;
    if(position.y > height - 1)
      position.y -= height - 1;
    else if(position.y < 0)
      position.y += height - 1;
    
    occupancyMap[floor(position.x)][floor(position.y)] = id;
  }
  
  public void render()
  {
    point(position.x, position.y);
  }
  
  private void updateVelocity()
  {
    int posX = floor(position.x);
    int posY = floor(position.y);
    int checkX;
    int checkY;
    int value;
    float totalVX = 0;
    float totalVY = 0;
    int num = 0;
    
    for(int i = -5; i < 5; i++)
    {
      for(int j = -5; j < 5; j++)
      {
        checkX = posX + i;
        checkY = posY + j;
        if(checkX < 0)
          checkX += width - 1;
        else if(checkX > width - 1)
          checkX -= width - 1;
        if(checkY < 0)
          checkY += height - 31;
        else if(checkY > height - 31)
          checkY -= height - 31;
        
        value = occupancyMap[checkX][checkY];
        if(value != -1)
        {
          totalVX += particles[value].velocity.x;
          totalVY += particles[value].velocity.y;
          if(drawLines)
          {
            if(abs(particles[value].position.x - position.x) <= 5 && abs(particles[value].position.y - position.y) <= 5)
              line(particles[value].position.x, particles[value].position.y, position.x, position.y);
          }
          num++;
        }
      }
    }
    
    if(totalVX / num < velocity.x)
      velocity.x -= 0.05;
    else if(totalVX / num > velocity.x)
      velocity.x += 0.05;
    if(totalVY / num < velocity.y)
      velocity.y -= 0.05;
    else if(totalVY / num > velocity.y)
      velocity.y += 0.05;
  }
}

