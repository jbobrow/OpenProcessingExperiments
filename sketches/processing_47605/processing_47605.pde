

//activate controlP5
import controlP5.*;
ControlP5 controlP5;
ControlWindow controlWindow;
ColorPicker cp;

float[] x,y;
int[] lifespan;
float oldX, oldY;
int accentValue;

//dashboard variables
public int particleLength = 120;
public float textureScale = 0.001;
public int Hue1 = 240;
public int Saturation1 = 100;
public int Brightness1 = 100;
public int Hue2 = 300;
public int Saturation2 = 100;
public int Brightness2 = 100;
public int backgroundColor = 0;
public int frameSpeed = 10;

//other variables
public int particleCount = 150;
int generationsPerFrame = 50;
float frameOffset = 0.0;


void setup() {
  
  size (640,960);
  smooth ();
  noFill ();
  strokeWeight(1.0);
  strokeCap(SQUARE);
  colorMode (HSB,360,100,100);
  
  //create matricies
  x = new float[particleCount];
  y = new float[particleCount];
  lifespan = new int[particleCount];
  background(0,0,backgroundColor);
  
  //set up controlP5 dashboard
  controlP5 = new ControlP5(this);
  controlP5.setAutoDraw(false);
  controlWindow = controlP5.addControlWindow("controlP5window",200,200,540,480);
  controlWindow.hideCoordinates();
  controlWindow.setBackground(color(0));
  
  Controller slider1 = controlP5.addSlider("particleLength",0,150,120,20,20,400,20);
  slider1.setWindow(controlWindow);
  Controller slider10 = controlP5.addSlider("frameSpeed",0,30,10,20,60,400,20);
  slider10.setWindow(controlWindow);
  
  Controller slider3 = controlP5.addSlider("Hue1",0,360,240,20,140,400,20);
  slider3.setWindow(controlWindow);
  Controller slider4 = controlP5.addSlider("Saturation1",0,100,100,20,180,400,20);
  slider4.setWindow(controlWindow);
  Controller slider5 = controlP5.addSlider("Brightness1",0,100,100,20,220,400,20);
  slider5.setWindow(controlWindow);
  
  Controller slider6 = controlP5.addSlider("Hue2",0,360,300,20,280,400,20);
  slider6.setWindow(controlWindow);
  Controller slider7 = controlP5.addSlider("Saturation2",0,100,100,20,320,400,20);
  slider7.setWindow(controlWindow);
  Controller slider8 = controlP5.addSlider("Brightness2",0,100,100,20,360,400,20);
  slider8.setWindow(controlWindow);
  
  Controller slider9 = controlP5.addSlider("backgroundColor",0,100,0,20,420,400,20);
  slider9.setWindow(controlWindow);
  
  controlWindow.setTitle("Controls");
 
}

void draw() {

  frameRate (frameSpeed);
  
  //primary
  particles (Hue1,Saturation1,Brightness1);
  //secondary
  particles (Hue2,Saturation2,Brightness2);
  //background accent
  if (backgroundColor <= 50) {
    accentValue = 100;
  } else {
    accentValue = 0;
  }
  particles (0,0,accentValue);
  
}

void particles (int hue01, int saturation01, int brightness01) {
  
  stroke (hue01, saturation01, brightness01, 20);
  for(int gen=0; gen < generationsPerFrame; gen++)
  {
    for(int i=0; i < particleCount; i++)
    {
      oldX = x[i];
      oldY = y[i];
       
      //increment all variables
      x[i] += 20 * (0.5 - noise(x[i]*textureScale, y[i]*textureScale, frameOffset + 0));
      y[i] += 20 * (0.5 - noise(x[i]*textureScale, y[i]*textureScale, frameOffset + 1));
      lifespan[i]--;
       
      line(oldX, oldY, x[i], y[i]);
       
      //if a particle has "died", reinitialize it
      if(lifespan[i] < 0)
      {
        x[i] = random(width+200)-100;
        y[i] = random(height+200)-100;
         
        lifespan[i] = (particleLength/2) + int (random(particleLength/2));
      }
    }
  }
  
}

void mousePressed() {
  
  background(0,0,backgroundColor);
  frameOffset = random(10.0);
  textureScale = 0.0005 + random(0.007);
  
}

