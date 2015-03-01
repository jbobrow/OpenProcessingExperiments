
// Using 10 m/s as terminal velocity for rain drops, taken hastily from here:
// Terminal Velocity of Raindrops Aloft, Foote & Toit, U of Arizona, 1968
// http://journals.ametsoc.org/doi/pdf/10.1175/1520-0450%281969%29008%3C0249%3ATVORA%3E2.0.CO%3B2
float globalScale = 10.0; // 5 is better on a local machine
float maxDropletSpeed = 10; 
float dropletTimeStep = .0416; // 1/24th of a second
int frameNum;
int dropLimit = 100;
int gridSize = 512;
int splashDurationDefault = 12;

color rainClr = color(10, 25, 200); // blue

Droplet[] droplets;

Droplet makeNewDroplet()
{
  return new Droplet(random(gridSize), random(gridSize), random(0.5, maxDropletSpeed*globalScale), splashDurationDefault);
}

Droplet makeNewDropletTop()
{
  return new Droplet(random(gridSize), gridSize+25, random(0.5, maxDropletSpeed*globalScale), splashDurationDefault);
}

void setup()
{
  gridSize = 512;
  frameNum = 0;
  size(gridSize, gridSize);
  noStroke(); // stop drawing outlines around everything
  colorMode(RGB, 256, 256, 256, 256);
  //colorMode(RGB, 256, 256, 256);
  //background(255);

  droplets = new Droplet[dropLimit];
  for (int i=0; i < dropLimit; i++)
  {
    droplets[i] = makeNewDroplet();
  }
}

void updateDroplets()
{
  for (int i=0; i < dropLimit; i++)
  {
    droplets[i].update();
  }
}

void drawDroplets()
{
  for (int i=0; i < dropLimit; i++)
  {
    droplets[i].draw();
  }
}

void reviveDroplets()
{
  // if a droplet is done, create a brand new droplet in its place
  for (int i=0; i < dropLimit; i++)
  {
    if (droplets[i].dropletIsDone)
    {
      droplets[i] = makeNewDropletTop();
    }
  }
}

void draw()
{
  frameNum++;
  background(255, 255, 255);

  updateDroplets();
  drawDroplets();
  reviveDroplets();
}


class Droplet {
  float ypos, xpos;
  float speed;
  boolean splashing;
  float timestep;
  float maxspeed, splashDuration;
  boolean dropletIsDone;
  int splashFrame;

  Droplet(float in_xpos, float in_ypos)
  {
    xpos = in_xpos;
    ypos = in_ypos;
    splashing = false;
    splashFrame = -1;

    dropletIsDone = false;
    speed = maxDropletSpeed;
    splashDuration = splashDurationDefault; // 12 frames
  }

  Droplet(float in_xpos, float in_ypos, float in_speed, float in_splashTime)
  {
    xpos = in_xpos;
    ypos = in_ypos;
    splashing = false;
    splashFrame = -1;
    dropletIsDone = false;

    setSpeed(in_speed);
    splashDuration = in_splashTime;
  }

  void setSpeed(float in_speed)
  {
    // used to override initial speed.
    /* 
     for instance, if you wanted the rain to start halted, 
     like it was dripping off of something
     */
    speed = min(in_speed, maxDropletSpeed*globalScale);
  }

  void update()
  {
    if (!splashing)
    { 
      // take a step at the current speed
      ypos -= dropletTimeStep * speed * globalScale;
  
      // update speed, up to  
      speed += 9.8 * dropletTimeStep * globalScale;
      setSpeed(speed);
  
      // check for ground hit
      if(ypos <= 0.0)
      {
        ypos = 0.0; // force position to ground position
        hit();
      }
    }else{
      if (frameNum > splashFrame + splashDuration) {
        dropletIsDone = true;
      }
    } 
  }

  void hit()
  {
    // call this to force the droplet into 'splash' mode
    splashing = true;
    splashFrame = frameNum;
  }

  void draw()
  {
    if (! dropletIsDone) {
      if (splashing)
      {
        drawSplashing();
      } else {
        drawFalling();
      }
    }
  }

  void drawFalling()
  {
    // draws a droplet with a comet tail blending with the background
    float alpha = 0.0;
    float speedStep = 1.0 / speed;
    
    for(int i=0;i < speed; i++){
      alpha = 256 * speedStep * (speed-i) ;
      fill(0,0,256,alpha);
      rect(xpos, gridSize-ypos-i, 1, 1);
      //rect(xpos, gridSize-ypos, 1, speed);
    }
  }

  void drawSplashing()
  {
    // draws a simple circle at impact point, which changes size over time
    fill(128,128,256,256);
    float radius = splashDuration - (frameNum - splashFrame);
    ellipse(xpos,gridSize-ypos,radius,radius);
  }
}

