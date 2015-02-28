

import ddf.minim.*;

Minim minim;
AudioPlayer rain;

class Drop
{
  float xpos, ypos, wide, high, gravity;
  float time = 0;

  public Drop() {
    xpos = random(0, 640);
    ypos = random(0,480);
    wide = random(0,2);
    high = random(30,60);
  }

  void display() {
    float i = map(mouseX, 0, width, 50, 200);
    fill(255, i);
    // fill(255,200);
    noStroke();
    ellipse(xpos,ypos, wide,high);
  }

  void fall() {
    float targetX= mouseX;
    float dx = targetX-currX;

    currX += dx * easing;
    println(dx);
    time = abs(ypos/96);
    float gravity = (1 * time * time) + 20;
    ypos += gravity;
    xpos += dx*(ypos/96);

    if(ypos >= random(350,height)) {
      ypos-=height;
      xpos+=random(0,640);
    }

    if(xpos>= width)
    {
      xpos -= width;
    }
    else if(xpos <= 0)
    {
      xpos += width;
    }
  }

  float get_time() {
    return time;
  }
}

class Splash
{
  float xpos, ypos, wide, high;
  float gray = random(0,50);
  int depth = 150;


  public Splash()
  {

    xpos = random(0,width);
    ypos = random(height - depth, height);
    wide = 10;
    high = 0.05;
  }
  void display() {
    noFill();
    for(int i = 0; i < 10; i++)
    {
      stroke(255,gray+((ypos-(height-depth))*i/150));
      ellipse(xpos, ypos, ((ypos-(height-depth))/10)+(((float)i/(3))*(mouseX/200)), ((ypos-(height-depth))/500)+((float)i/2));
    }
  }

  void fade() {

    gray-=2;
    fill(255,gray);

    if(gray < 0) {
      xpos = random(0,640);
      ypos = random(height - depth, height);
      gray = random(0,50);
      this.display();
    }
  }
}

float currX = (640/2.0);
float easing = 0.025;

PImage backdrop;

Drop [] drops = new Drop[200];
Splash [] splashes = new Splash[50];


void setup()
{
  size(640,480);
  smooth();
  frameRate(60);

  minim = new Minim(this);
  rain = minim.loadFile("Hillside_Thunder_preview_whitenoisemp3s-com.wav", 2048);

  rain.loop();

  backdrop = loadImage("testImage.jpg");

  for(int i = 0; i < drops.length; i++)
  {
    drops[i] = new Drop();
  }
  for(int i = 0; i<splashes.length; i++)
  {
    splashes[i] = new Splash();
  }
}

void draw()
{
  image(backdrop,0,0);

  float val = map(mouseX, 0, width, -30, 6);

  changeBG(mouseX);
  int numDrops = (int)map(mouseX, 0, width, 0, drops.length);
  for(int i = 0; i <numDrops; i++)
  {
    drops[i].display();
    drops[i].fall();
  }

  int numSplashes = (int)map(mouseX, 0, width, 0, splashes.length);
  for(int i = 0; i<numSplashes; i++)
  {
    splashes[i].display();
    splashes[i].fade();
  }

  rain.setGain(val);
}

void changeBG(float mousex)
{
  float backgroundVal = 150- map(mousex, 0, 640, 0, 120);
  fill(backgroundVal, 100);
  rect(0,0, width, height);
}


void stop()
{
  // always close Minim audio classes when you are done with them
  rain.close();
  // always stop Minim before exiting
  minim.stop();

  super.stop();
}


