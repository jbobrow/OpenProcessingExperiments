
import controlP5.*;
import processing.opengl.*;


/**
 * explore_perlin -- 
 * 
 * Author: Greg Schafer (grschafer at gmail) -- 
 * This applet generates a perlin noise "landscape" and gives the users some controls over the camera
 * and some noise parameters. Inspired by Notch's hint about how the landscape in Minecraft is generated. --
 * Controls:
 *    -Move the mouse to "move" the landscape,
 *    -Hold CTRL to move the mouse without moving the landscape,
 *    -Click and drag to move the camera --
 * Goal: Explore! Feedback is welcome.
 */

// This is all public because of strict applet permissions  =\
public PImage extrude;
public float[][] values;
public float angle = 0;
public int scaler = 20;
public int fieldWidth = 64;
public int fieldLength = 48;
/*public int fieldWidth = 128;
public int fieldLength = 96;*/

public float mapX = 0;
public float mapY = 0;
public float camX = 0;
public float camY = 0;
public float prevdx = 0;
public float prevdy = 0;

public float lastRots[] = {
  0.0, 0.0, 0.0
};
public float curRots[] = new float[3];
public float noiseScale = 0.20;
public float noiseFalloff = 0.50;
public float waterLevel = 0;
public float noiseX[][];
public float noiseY[][];

public ControlP5 controlP5;
public int uiBarHeight = 40;
public boolean allowCameraMovement = true;
public boolean boxy = false;
public boolean edges = false;
public boolean waterVisible = false;

void setup()
{
  //size(640, 480, OPENGL);
  size(640, 480, P3D);
  extrude = new PImage(fieldWidth, fieldLength);    // just used for width,height of noise field

  // Load the image into a new array
  values = new float[extrude.width][extrude.height];
  noiseX = new float[extrude.width][extrude.height];
  noiseY = new float[extrude.width][extrude.height];
  waterLevel = 6*extrude.height;

  initGUI();
}

public void initGUI()
{
  controlP5 = new ControlP5(this);
  controlP5.addToggle("boxy", false, 10, 4, 20, 20);
  controlP5.addToggle("edges", false, 40, 4, 20, 20);
  controlP5.addSlider("noiseScale", 0.01, 1, noiseScale, 80, 10, 100, 20);
  controlP5.addSlider("noiseFalloff", 0, 1, noiseFalloff, 240, 10, 100, 20);
  controlP5.addToggle("water", false, 420, 4, 20, 20);
  controlP5.addSlider("waterLevel", 0, 6*extrude.height, waterLevel, 450, 10, 100, 20).setDecimalPrecision(0);
  ((Slider)controlP5.controller("waterLevel")).lock();
  ((Slider)controlP5.controller("waterLevel")).setColorForeground(color(80, 80, 80));
  controlP5.addBang("regen", 610, 4, 20, 20).setTriggerEvent(Bang.RELEASE);
}

void draw()
{
  // draw 3D stuff
  hint(ENABLE_DEPTH_TEST);  // not sure if this is necessary
  pushMatrix();         // get translation (for drawing UI overlay later)

  lights();
  background(0);

  float cameraY = height/2.0;
  float fov = mouseY/float(width) * PI/2;
  float cameraZ = cameraY / tan(fov / 2.0);
  float aspect = float(width)/float(height);


  //perspective(PI/3, aspect, cameraZ/10.0, cameraZ*10.0);
  perspective();

  // translate before rotating
  translate(width/2, height/2, -width/2);

  noiseDetail(4, noiseFalloff);
  regenNoiseValues(mouseX, mouseY);  // noise values updated in mouseMoved()

  // interpolate between current and target rotations
  for (int i = 0; i < 3; ++i)
  {
    // curRots is updated in mouseDragged() event handler function (below)
    lastRots[i] += 0.05*(curRots[i] - lastRots[i]);
  }
  rotateX(lastRots[0]);
  rotateZ(lastRots[2]);

  // translate before drawing
  translate(-scaler*extrude.width/2, -scaler*extrude.height/2, 4*extrude.height);

  // regen noise values
  for (int y = 0; y < extrude.height; y++)
  {
    for (int x = 0; x < extrude.width; x++)
    {
      float noiseVal = noise(noiseX[x][y], noiseY[x][y]) * 255;
      values[x][y] = noiseVal;
    }
  }

  if (edges)
    stroke(0);
  drawSurface();

  // draw water plane
  if (waterVisible)
  {
    fill(0, 0, 255, 80);
    beginShape();
    vertex(0, 0, -waterLevel);
    vertex(0, scaler*extrude.height, -waterLevel);
    vertex(scaler*extrude.width, scaler*extrude.height, -waterLevel);
    vertex(scaler*extrude.width, 0, -waterLevel);
    endShape(CLOSE);
  }

  popMatrix();         // regen translation to draw UI overlay
  hint(DISABLE_DEPTH_TEST);  // not sure if this is necessary

  // draw UI rectangle
  fill(0, 80);
  rect(0, 0, width, uiBarHeight);
  controlP5.draw();
}

public void regenNoiseValues(int mx, int my)
{
  // regen noise values if camera isn't rotating
  for (int y = 0; y < extrude.height; y++)
  {
    for (int x = 0; x < extrude.width; x++)
    {
      // remove the int() cast for smoother map movement (in-between grid values possible)
      noiseX[x][y] = (int(mapX/4) + x) * noiseScale/2;
      noiseY[x][y] = (int(mapY/4) + y) * noiseScale/2;
      // use a base perlin noise to generate noiseScale values? (for regional uniqueness)
    }
  }
}

public void regen()  // generates new noise seed based on current time
{
  noiseSeed(second() + minute() + hour() + millis());
}

public void mouseMoved()  // map movement
{
  // if user holds down ctrl, then moving the mouse
  // won't move the noise map/surface (this is to allow
  // the user to use menu w/o losing spot in landscape)
  boolean disableMapMovement = false;
  if (keyPressed)
    if (key == CODED)
      if (keyCode == CONTROL)
        disableMapMovement = true;

  if (!disableMapMovement)
  {
    float dx = mouseX - pmouseX;
    float dy = mouseY - pmouseY;
    // if cursor has moved "too far" (10x most recent mouse displacement)
    // then it probably went off screen or over the ui bar, so that big
    // displacement should be ignored (so that the noise surface doesn't
    // "jump" because it's translating really far
    if (mouseY > uiBarHeight && dist(pmouseX, pmouseY, mouseX, mouseY)*.1 < mag(prevdx, prevdy))
    {
      mapX += dx;
      mapY += dy;
    }
    prevdx = dx;
    prevdy = dy;
  }
}
public void mouseDragged()  // camera movement
{
  if (allowCameraMovement)
  {
    camX += mouseX - pmouseX;
    camY += mouseY - pmouseY;
    curRots[0] = -camY * 1.5*PI/float(height/2);
    curRots[2] = camX * 1.5*PI/float(width/2);
  }
}

// these functions adjust the coordinate system for rotating/translating the noise surface
public void mousePressed()
{
  if (mouseY <= uiBarHeight)
    allowCameraMovement = false;
  else
    allowCameraMovement = true;
}

public void water()
{
  // flip boolean value
  // enable/disable waterLevel slider
  Slider waterSlider = ((Slider)controlP5.controller("waterLevel"));
  if (waterVisible)
  {
    waterVisible = false;
    waterSlider.lock();
    waterSlider.setColorForeground(color(80, 80, 80));
  }
  else
  {
    waterVisible = true;
    waterSlider.unlock();
    waterSlider.setColorForeground(color(0, 105, 140));
  }
}

// loops to draw the surface of the perlin noise
public void drawSurface()
{
  // display the noise surface
  for (int y = 1; y < extrude.height; y++)
  {
    for (int x = 1; x < extrude.width; x++)
    {
      // add some kind of height-based texturing (green valleys, stony mountains, etc)?
      fill(255 - values[x][y]);

      if (!boxy)    // then normal vertexing
      {
        beginShape();
        vertex(x*scaler, y*scaler, -values[x][y]);
        vertex(x*scaler-scaler, y*scaler, -values[x-1][y]);
        vertex(x*scaler-scaler, y*scaler-scaler, -values[x-1][y-1]);
        vertex(x*scaler, y*scaler-scaler, -values[x][y-1]);
        endShape(CLOSE);
      }
      else        // minecraft-ify! = blocky terrain
      {
        float val1 = int(-values[x][y]/scaler)*scaler;
        float val2 = int(-values[x][y-1]/scaler)*scaler;
        float val3 = int(-values[x-1][y]/scaler)*scaler;
        beginShape();
        vertex(x*scaler, y*scaler, val1);
        vertex(x*scaler-scaler, y*scaler, val1);
        vertex(x*scaler-scaler, y*scaler-scaler, val1);
        vertex(x*scaler, y*scaler-scaler, val1);
        endShape(CLOSE);
        // with edges
        beginShape();
        vertex(x*scaler, y*scaler-scaler, val1);
        vertex(x*scaler, y*scaler-scaler, val2);
        vertex(x*scaler-scaler, y*scaler-scaler, val2);
        vertex(x*scaler-scaler, y*scaler-scaler, val1);
        endShape(CLOSE);
        beginShape();
        vertex(x*scaler-scaler, y*scaler, val1);
        vertex(x*scaler-scaler, y*scaler, val3);
        vertex(x*scaler-scaler, y*scaler-scaler, val3);
        vertex(x*scaler-scaler, y*scaler-scaler, val1);
        endShape(CLOSE);
      }
    }
  }
}


