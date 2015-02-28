
/**
 * <h1>SpaceBoxes_by_spxl</h1>
 * <h2 class="byline">by <a href="http://subpixels.com">subpixel</a></h2>
 * <p>Created: 2009-01-17</p>
 *
 * <p><em>Based on Falling Box by takumi</em></p>
 * <p>Flying through an asteroid field, kind of.</p>
 * <p>Autopilot (no controls!)</p>
 * <h2>Keys:</h2>
 * <ul>
 * <li>[space] toggle paused</li>
 * <li>[b] toggle background</li>
 * <li>[a] auto toggle background</li>
 * <li>[r] toggle regular/random block sizes</li>
 * </ul>
 */

//import processing.opengl.*;  // Only need if you want to use OPENGL mode

// Oldschool / basic use of arrays carried over from takumi's code
// At least 1-dimensional arrays are fast to access

int n=100;  // Number of flying objects

// Position
float[] X=new float[n]; 
float[] Y=new float[n]; 
float[] Z=new float[n]; 

// Velocity
float[] vX=new float[n];
float[] vY=new float[n];
float[] vZ=new float[n];

// Size (of central box)
int[] s=new int[n]; 

// Rotation
float[] thetaX=new float[n]; 
float[] thetaY=new float[n]; 
float[] thetaZ=new float[n]; 

// Angular velocity
float[] omegaX=new float[n];
float[] omegaY=new float[n];
float[] omegaZ=new float[n];

// Size of side boxes
int[] s1=new int[n];
int[] s2=new int[n];
int[] s3=new int[n];
int[] s4=new int[n];
int[] s5=new int[n];
int[] s6=new int[n];

// Distance of (centres of) side boxes from (centre of) central box
float[] d1=new float[n];
float[] d2=new float[n];
float[] d3=new float[n];
float[] d4=new float[n];
float[] d5=new float[n];
float[] d6=new float[n];

PImage bg;   // To hold a background image if you want one
int    bgx;  // Size information for drawing background
int    bgy;  // Size information for drawing background

float theta = 0;  // Current rotation (for whole scene)
float omega = 0;  // Angular velocity for whole scene rotation

boolean paused  = false;  // Want to be able to toggle paused/unpaused
boolean auto    = false;  // Automatic toggle background?
boolean showBg  = true;   // Show background?
boolean regular = false;  // Regular size/spacing or random?

int autoCountdown = 0;    // Frames to go until next random action (if auto==true)

// ------------------------------------------------------------
// Setup method
// ------------------------------------------------------------
void setup(){ 
//  size(screen.width, screen.height >> 1, OPENGL);  // Fullscreen anyone? :o)
  size(720, 320, P3D);  // Applet-friendly
  frameRate(30); 

  colorMode(HSB, 100); 

  bg = loadImage("bg.png");  // Load a background image
  int windowSize = max(width, height);
  int imageSize = min(bg.width, bg.height);
  int factor = ceil(2.5 * float(windowSize) / float(imageSize));
  bgx = bg.width * factor;
  bgy = bg.height * factor;

  for(int i=0; i<n; i++)
  {
    randomise(i);
  }
} 

// ------------------------------------------------------------
// Draw method
// ------------------------------------------------------------
void draw()
{ 
  background(0);
  int width_2 = width >> 1;
  int height_2 = height >> 1;
  
  camera(0, 0, 2000, 0, 0, -1, 0, 1, 0);

  // Spin the entire scene
  omega = (omega + (noise(millis()*0.001)-0.5)*0.03) * 0.92;
  theta += omega;
  rotateZ(theta);

  if (auto)
  {
    autoCountdown--;
    if (autoCountdown <= 0)
    {
      toggleBackground();
      resetAutoCountdown();
    }
  }
  
  if (showBg)  // Show background image?
  {
    image(bg, -bgx, -bgy, bgx << 1, bgy << 1);
  }
  
  directionalLight(51, 102, 126, 0, 1, 0);
  directionalLight(10, 20, 30, 0, -1, 0);

//  translate(0, 0, 2500);

  noStroke();
  fill(100);

  for(int i=0; i<n; i++)
  {
    pushMatrix();
    
    translate(X[i], Y[i], Z[i]);  // Central box position
    rotateX(thetaX[i]);  // Orientation
    rotateY(thetaY[i]);  // ...
    rotateZ(thetaZ[i]);  // ...

    box(s[i]);  // Central box

    translate(d1[i], 0, 0);  // Go right
    box(s1[i]);
    translate(-d1[i]-d2[i], 0, 0);  // Go back to centre and left
    box(s2[i]);

    translate(d2[i], d3[i], 0);  // Go back to centre and "down" (along -Y axis)
    box(s3[i]);
    translate(0, -d3[i]-d4[i], 0);  // Go back to centre and up
    box(s4[i]);

    translate(0, d4[i], d5[i]);  // Go back to centre and "in front"
    box(s5[i]);
    translate(0, 0, -d5[i]-d6[i]);  // Go back to centre and "behind"
    box(s6[i]);

    popMatrix();

    // Update position and rotation
    
    if(Z[i] > 2000)
    {
      randomise(i);
    }
    else
    {
      // Move (constant velocity)
      X[i] += vX[i];
      Y[i] += vY[i];
      Z[i] += vZ[i];
      
      // Rotate
      thetaX[i] += omegaX[i];
      thetaY[i] += omegaY[i];
      thetaZ[i] += omegaZ[i];
    } 
  } 
} 

// ------------------------------------------------------------
// Initilise flying object number with array index i
// ------------------------------------------------------------
void randomise(int i)
{
  int b = int(random(1, 4)) * 10;
  int b_2 = b >> 1;
  
  X[i]=0;
  Y[i]=0;
  Z[i]=-random(1000);

  vX[i]=random(-1, 1);
  vY[i]=random(-1, 1);
  vZ[i]=random(10);

  thetaX[i]=random(TWO_PI); 
  thetaY[i]=random(TWO_PI); 
  thetaZ[i]=0;  // Already as (dis-)oriented as one can be from 2 axes. :o)

  omegaX[i]=random(0.01, 0.1);
  omegaY[i]=random(0.01, 0.1);
  omegaZ[i]=0;  // Spinning on a 3rd axis doesn't help.. gives strange motion

  s[i] = b;  // Set size of central box
  
  if (regular)
  {
      s1[i] = s2[i] = s3[i] = s4[i] = s5[i] = s6[i] = b_2;  // Half central box size
      d1[i] = d2[i] = d3[i] = d4[i] = d5[i] = d6[i] = b;    // Spaced by central box size
  }
  else
  {
    // Size of 6 boxes surrounding central box
    s1[i]=int(random(b_2, b));
    s2[i]=int(random(b_2, b));
    s3[i]=int(random(b_2, b));
    s4[i]=int(random(b_2, b));
    s5[i]=int(random(b_2, b));
    s6[i]=int(random(b_2, b));
  
    // Distance of 6 surrounding boxes from central box (measured from centres)
    d1[i] = b_2 + int(random(s1[i] >> 1, s1[i] << 1));
    d2[i] = b_2 + int(random(s2[i] >> 1, s2[i] << 1));
    d3[i] = b_2 + int(random(s3[i] >> 1, s3[i] << 1));
    d4[i] = b_2 + int(random(s4[i] >> 1, s4[i] << 1));
    d5[i] = b_2 + int(random(s5[i] >> 1, s5[i] << 1));
    d6[i] = b_2 + int(random(s6[i] >> 1, s6[i] << 1));
  }
}

// ------------------------------------------------------------
// Handle keyboard input
// ------------------------------------------------------------
void keyPressed()
{
  switch(key)
  {
    case ' ': togglePaused();
              break;

    case 'A':
    case 'a': toggleAuto();
              break;

    case 'B':
    case 'b': toggleBackground();
              break;

    case 'R':
    case 'r': toggleRegular();
              break;
  }
}

void toggleAuto()
{
  auto = !auto;
  if (auto) resetAutoCountdown();
}

void resetAutoCountdown()
{
  autoCountdown = int(random(100)) + 10;
}

void toggleBackground()
{
  showBg = !showBg;
}

void toggleRegular()
{
  regular = !regular;
}

void togglePaused()
{
  paused = !paused;
  if (paused)
    noLoop();
  else
    loop();
}


