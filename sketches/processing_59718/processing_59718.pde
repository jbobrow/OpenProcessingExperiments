
import controlP5.*;

Particle[] p;
ControlP5 cp5;
boolean rColours = false;
boolean lines = false;
float thickness = 1;
int track = 0;

void setup()
{
  frameRate(100);
  background(0);
  cp5 = new ControlP5(this);
  size(640, 480); 

  cp5.addSlider("track")
    .setPosition(20, 20)
      .setRange(0, 100)
        .setSize(100, 10);
        
  cp5.addSlider("thickness")
    .setPosition(20, 40)
      .setRange(.5, 5)
        .setSize(100, 10);

  cp5.addToggle("rColours")
    .setPosition(20, 60)
      .setValue(false)
        .setSize(25, 10)
          .setCaptionLabel("Random Colours")
            .setMode(ControlP5.SWITCH);

  cp5.addToggle("lines")
    .setPosition(20, 90)
      .setValue(false)
        .setSize(25, 10)
          .setCaptionLabel("Toggle Lines")
            .setMode(ControlP5.SWITCH);

  createParticles();
}

void createParticles()
{
  p = new Particle[500];
  for (int i = 0; i<500; i++)
  {
    p[i] = new Particle(width / 2, height / 2);
  }
}

void draw()
{
  fill(0, 0, 0, track);
  rect(0, 0, width, height);
  for (int i = 0; i<500; i++)
  {
    p[i].setSize(thickness);
    p[i].update(rColours, lines);
  }
}

class Particle
{
  float x, y, s, ySpeed, xSpeed;
  boolean randomColour;
  Particle(float xpos, float ypos)
  {
    x = xpos;
    y = ypos;
    s = 1;
    resetSpeed();
  }
  
  void setSize(float _size)
  {
    s = _size;
  }

  void resetSpeed()
  {
    xSpeed = randomRange(-5, 5);
    ySpeed = randomRange(-5, 5);
  }

  void update(boolean randomColour, boolean lines)
  {
    this.randomColour = randomColour;
    
    if (lines) {
      stroke(valColour(), valColour(), valColour());
      strokeWeight(s);
      line(width / 2, height / 2, x, y);
    } 
    else { 
      fill(valColour(), valColour(), valColour());
      noStroke();
      ellipse(x, y, s, s);
    }
    
    x += xSpeed;
    y += ySpeed;

    if (x >= width || x <= 0) {
      xSpeed *= -1;
    }

    if (y >= height || y <= 0) {
      ySpeed *= -1;
    }
  }
  
  int valColour()
  {
    return randomColour ? int(random(255)) : 255;
  }

  float randomRange(float _min, float _max)
  {
    return random(1) * (_max-_min) + _min;
  }
}


