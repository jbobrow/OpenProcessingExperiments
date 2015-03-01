
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

int counter;

void setup() {  //setup function called initially, only once
    size (500, 500);
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();


  if(mousePressed == true) { //add some interaction
background (73, 106, 142);
fill (150);
noStroke ();
rect (0, 0, 500, 200);
ellipse (0, 200, 50, 50);
ellipse (25, 200, 50, 50);
ellipse (50, 200, 50, 50);
ellipse (75, 200, 50, 50);
ellipse (100, 200, 50, 50);
ellipse (125, 200, 50, 50);
ellipse (150, 200, 50, 50);
ellipse (175, 200, 50, 50);
ellipse (200, 200, 50, 50);
ellipse (225, 200, 50, 50);
ellipse (250, 200, 50, 50);
ellipse (275, 200, 50, 50);
ellipse (300, 200, 50, 50);
ellipse (325, 200, 50, 50);
ellipse (350, 200, 50, 50);
ellipse (375, 200, 50, 50);
ellipse (400, 200, 50, 50);
ellipse (425, 200, 50, 50);
ellipse (450, 200, 50, 50);
ellipse (475, 200, 50, 50);
ellipse (500, 200, 50, 50);
fill (137, 90, 58);
rect (0, 450, 500, 49);
fill (45, 105, 39);
triangle (0, 450, 5, 400, 10, 450);
triangle (40, 450, 45, 400, 50, 450);
triangle (80, 450, 85, 400, 90, 450);
triangle (100, 450, 105, 400, 110, 450);
triangle (140, 450, 145, 400, 150, 450);
triangle (180, 450, 185, 400, 190, 450);
triangle (220, 450, 225, 400, 230, 450);
triangle (250, 450, 255, 400, 260, 450);
triangle (290, 450, 295, 400, 300, 450);
triangle (330, 450, 335, 400, 340, 450);
triangle (360, 450, 365, 400, 370, 450);
triangle (370, 450, 375, 400, 380, 450);
triangle (400, 450, 405, 400, 410, 450);
triangle (440, 450, 445, 400, 450, 450);
triangle (480, 450, 485, 400, 490, 450);
  }
else   {
background(204, 255, 255);  //set background white
fill (255, 350-mouseY/2, 0);
stroke (255, 350-mouseY/2, 0);
ellipse (mouseX, mouseY, 100, 100);
line (mouseX, mouseY, 0, 0);
line (mouseX, mouseY, 0, width);
line (mouseX, mouseY, width, height);
line (mouseX, mouseY, width, 0);
line (mouseX, mouseY, width/2, 0);
line (mouseX, mouseY, 0, height/2);
line (mouseX, mouseY, width, height/2);
line (mouseX, mouseY, width/2, height);
fill (150);
stroke (150);
ellipse (0, 0, 50, 50);
ellipse (40, 0, 50, 50);
ellipse (80, 0, 50, 50);
ellipse (120, 0, 50, 50);
ellipse (160, 0, 50, 50);
ellipse (0, 30, 50, 50);
ellipse (40, 30, 50, 50);
ellipse (80, 30, 50, 50);
ellipse (120, 30, 50, 50);
ellipse (0, 60, 50, 50);
ellipse (40, 60, 50, 50);
ellipse (80, 60, 50, 50);
ellipse (0, 90, 50, 50);
ellipse (40, 90, 50, 50);
ellipse (60, 80, 50, 50);
ellipse (10, 90, 50, 50);
ellipse (110, 50, 50, 50);
ellipse (150, 20, 50, 50);
  }
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

