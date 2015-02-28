
/**
 * spxlConeWheel                                      <br/>
 * http://subpixels.com                               <br/>
 * 2009-03-10 by subpixel                             <br/>
 *                                                    <br/>
 * Keys:                                              <br/>
 *  [space] pause                                     <br/>
 *  [a]uto mode on/off                                <br/>
 *  [up]/[down] +/- number of spikes                  <br/>
 *  [right/[left] +/- number of sides for each spike  <br/>    
 */

int numSpikes,  numSpikesCountdown,  maxNumSpikes  = 100;
int spikeSides, spikeSidesCountdown, maxSpikeSides = 32;

boolean paused = false;  // Paused?
boolean auto   = true;   // Auto change every few seconds?

float x, tx;
float y, ty;
float z, tz;

float easeValue = 0.1;  // Move 0.1 of the way to the target

int w_2, h_2;  // Half window width, height

void setup()
{
  size(900, 300, P3D);

  colorMode(HSB, TWO_PI, 100, 100);

  cursor(CROSS);
  noCursor();  // Has no effect in browser

  w_2 = width >> 1;   // Half width
  h_2 = height >> 1;  // Half height

  randomSeed(second()+60*(minute()+60*(hour()+24*day())));
  
  randomise();
  numSpikesCountdown  += frameRate * 4;
  spikeSidesCountdown += frameRate * 4;

  x = tx = w_2;
  y = ty = h_2;
  z = -10000; tz = 0;
}

void draw()
{
  if (auto)
  {
    if (numSpikesCountdown-- < 1)  randomiseNumSpikes();
    if (spikeSidesCountdown-- < 1) randomiseSpikeSides();
  }
  
  x = lerp(x, tx, easeValue);
  y = lerp(y, ty, easeValue);
  z = lerp(z, tz, easeValue);
  
  lights();
  
  background(0);
  translate(x, y, z);
//  rotateX(frameCount*0.01);
//  rotateY(frameCount*0.007);
  rotateZ(frameCount*0.011);
  
  float thetaStep = TWO_PI / numSpikes;
  
  float radius = (w_2 - dist(x, y, w_2, h_2)) / 4;
  float spikeBaseRadius = radius * 0.3;
  float spikeLen = radius * 2;

  noStroke();

  for (int i = 0; i < numSpikes; i++)
  {
    float theta = i * thetaStep;
    
    pushMatrix();
    
    translate(0, radius * (1 + noise(i, frameCount*0.02)), 0);

    rotateY(PI * sin(frameCount * 0.04 + 10*noise(i)));  // twisting around

    fill((theta + frameCount * 0.01) % TWO_PI, 100, 100);
    conie(spikeLen, spikeBaseRadius, spikeSides);
    rotateX(PI);
    conie(spikeLen/4, spikeBaseRadius, spikeSides);
    
//    fill((theta + frameCount * 0.01 + PI) % TWO_PI, 100, 100);
//    translate(0, spikeLen/2, 0);
//    sphereDetail(5);
//    sphere(10);

    popMatrix();
    
    rotateZ(thetaStep);
  }
}

// Draw an upright "cone" (pyramid)
// The base is on the X-Z plane and the tip is in Y direction
void conie(float coneHeight, float baseRadius, int numSides)
{
  float thetaStep = TWO_PI / numSides;
  float theta = 0;
  
  beginShape(TRIANGLE_FAN);
  vertex(0, coneHeight, 0);  // Tip of cone

  // Base of cone
  for (int i = 0; i <= numSides; i++)
  {
    vertex(baseRadius * cos(theta), 0, baseRadius * sin(theta));
    theta += thetaStep;
  }

  endShape();
}

void mouseMoved()
{
  targetMouse();
}
void mouseDragged()
{
  targetMouse();
}
void targetMouse()
{
  tx = mouseX;
  ty = mouseY;
}

void keyPressed()
{
  if (key == CODED)
  switch (keyCode)
  {
    case UP:
      if (numSpikes < maxNumSpikes) numSpikes++;
      break;
    case DOWN:
      if (numSpikes > 0) numSpikes--;
      break;
    case LEFT:
      if (spikeSides > 2) spikeSides--;
      break;
    case RIGHT:
      if (spikeSides < maxSpikeSides) spikeSides++;
      break;
  }
  else
  switch (key)
  {
    case ' ':
      paused = !paused;
      if (paused)
        noLoop();
      else
        loop();
      break;
    case 'a':
    case 'A':
      auto = !auto;
      if (auto) randomise();
      break;
  }
}

void randomise()
{
  randomiseNumSpikes();
  randomiseSpikeSides();
}
void randomiseNumSpikes()
{
  numSpikes = 1 + rnd(maxNumSpikes);
  numSpikesCountdown = rndCountdown();
}
void randomiseSpikeSides()
{
  spikeSides = 2 + rnd(11);
  spikeSidesCountdown = rndCountdown();
}
int rndCountdown()
{
  return int(frameRate * random(4, 12)); // 4 to 12 seconds
}
int rnd(int n)
{
  return int(random(n));  // 0 to n-1
}


