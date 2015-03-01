
//Skeleton of the project here

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer xmascountry, xmashits, xmasclassic, xmassmooth;
BeatDetect beat;

int state;
int STATE_MAIN = 0;
int STATE_CLASSIC = 1;
int STATE_HITS = 2;
int STATE_SMOOTH = 3;
int STATE_COUNTRY= 4;

float LOpac, SOpac, FOpac;

PImage xmasTree, xmasSnow, xmasFire, xmasSanta, xmasTreeLights, xmasSantaStars, xmasFireLight, ornament;
PFont lucida;

ArrayList <Snowflakes> flakes = new ArrayList<Snowflakes>();

snowglobe s1, s2, s3, s4;
Ornament orn;

void setup()
{
  size(800, 600, P3D);
  state = STATE_MAIN;

  imageMode(CENTER);
  xmasTree = loadImage("xmasTree.jpg");    //tree background
  xmasSanta = loadImage("xmasSanta.jpg");  //santa background
  xmasFire = loadImage("xmasFire.jpg");    //fireplace background
  xmasSnow = loadImage("xmasSnow.jpg");    //snow scene background
  xmasTreeLights = loadImage("xmasTreeLights2.png");  //lights on tree
  xmasSantaStars = loadImage("xmasSantaStars.png");  //stars in santa
  xmasFireLight = loadImage("xmasFireLight.png");    //flickering fire
  ornament = loadImage("ornament.png");              //ornament icon

  lucida = loadFont("LucidaBlackletter-48.vlw");
  textFont(lucida);
  textAlign(CENTER);

  orn = new Ornament(50, 550, 50, 50);

  minim = new Minim (this);
  beat = new BeatDetect();    //beat detection function
  beat.setSensitivity(0);
  xmascountry = minim.loadFile("http://streaming207.radionomy.com:80/CountryChristmas", 512);    //Country station
  xmashits = minim.loadFile("http://streaming207.radionomy.com:80/TheChristmasStation", 512);    //Hits station
  xmasclassic = minim.loadFile("http://streaming206.radionomy.com:80/ChristmasClassics2014", 512);    //Classics station
  xmassmooth = minim.loadFile("http://streaming204.radionomy.com:80/Jazz-a-christmas", 512);      //Jazz station

  xmascountry.play();
  xmashits.play();
  xmasclassic.play();
  xmassmooth.play();

  xmascountry.mute();
  xmashits.mute();
  xmasclassic.mute();
  xmassmooth.mute();

  s1 = new snowglobe(width/4, height/4);
  s2 = new snowglobe(3*width/4, height/4);
  s3 = new snowglobe(width/4, 3*height/4);
  s4 = new snowglobe(3*width/4, 3*height/4);

  smooth();
}

void draw()
{
  if (state == STATE_MAIN)
  {
    Menu();

    xmashits.mute();
    xmascountry.mute();
    xmasclassic.mute();
    xmassmooth.mute();
  } else if (state == STATE_CLASSIC)
  {
    Classic();

    xmasclassic.unmute();
    xmashits.mute();
    xmascountry.mute();
    xmassmooth.mute();

    beat.detect(xmasclassic.mix);
  } else if (state == STATE_HITS)
  {
    Hits();

    xmashits.unmute();
    xmascountry.mute();
    xmasclassic.mute();
    xmassmooth.mute();

    beat.detect(xmashits.mix);
  } else if (state == STATE_SMOOTH)
  {
    Smooth();

    xmassmooth.unmute();
    xmashits.mute();
    xmascountry.mute();
    xmasclassic.mute();

    beat.detect(xmassmooth.mix);
  } else if (state == STATE_COUNTRY)
  {
    Country();

    xmascountry.unmute();
    xmashits.mute();
    xmasclassic.mute();
    xmassmooth.mute();

    beat.detect(xmascountry.mix);
  }
}

//Classic music screen

void Classic()
{
  image(xmasSnow, width/2, height/2, width, height);
  fill(#4D2C16);
  textSize(36);
  text("Christmas Classics", 450, 570);

  orn.draw();    //draw the ornament icon

  if (beat.isOnset())    //if beat is detected, add snowflakes to arraylist
  {
    flakes.add(new Snowflakes(random(width), 0));
    flakes.add(new Snowflakes(random(width), 0));
  }

  for (int i = 0; i < flakes.size(); i++)    //draw snowflakes for each spot
  {
    Snowflakes f = (Snowflakes) flakes.get(i);
    f.draw();
  }
  if (flakes.size() > 150)    //if there's more than 150 snowflakes, remove the 1st one, etc.
  {
    flakes.remove(0);
  }
}

//Country music screen

void Country()
{
  pushStyle();
  tint(#C6C6C6);
  image(xmasSanta, width/2, height/2, width, height);
  pushStyle();
  tint(255, SOpac);
  image(xmasSantaStars, width/2, height/2, width, height);
  popStyle();
  popStyle();

  fill(#1F226A);
  textSize(36);
  text("Christmas Country", width/2, 200);

  orn.draw();

  if (beat.isOnset())
  {
    SOpac = 255;
    flakes.add(new Snowflakes(random(width), 0));
    flakes.add(new Snowflakes(random(width), 0));
  }
  for (int i = 0; i < flakes.size(); i++)
  {
    Snowflakes f = (Snowflakes) flakes.get(i);
    f.draw();
  }
  if (flakes.size() > 150)
  {
    flakes.remove(0);
  }

  SOpac *= .2;
}

//Hits music screen

void Hits()
{
  pushStyle();
  tint(210);
  image(xmasTree, width/2, height/2, width, height);
  pushStyle();
  tint(255, LOpac);
  image(xmasTreeLights, width/2, height/2, width, height);
  popStyle();
  popStyle();

  fill(#1D1689);
  textSize(36);
  text("Christmas Hits", 370, 570);

  orn.draw();

  if (beat.isOnset())
  {
    LOpac = 255;
  }

  LOpac *= .2;
}

//Jazz music screen

void Smooth()
{
  image(xmasFire, width/2, height/2, width, height);  //background image
  pushStyle();
  tint(255, FOpac);      //opacity of light layer
  image(xmasFireLight, width/2, height/2, width, height);    //light layer
  popStyle();

  fill(#DE0D0D);
  textSize(36);
  text("Christmas Jazz", 220, 150);

  orn.draw();    //draw the ornament icon

  if (beat.isOnset())    //if there is a beat detected, bump the light opacity up to 255
  {
    FOpac = 255;
  }

  FOpac *= .2;    //rate at which the opac. decreases
}

//drawing the main menu and everything on it

void Menu()
{
  background(#0F0821);
  lights();

  pushStyle();
  fill(#FFC858);
  textSize(42);
  text("Select any Orb", width/2, height/2);
  popStyle();

  pushMatrix();                  //classic orb
  translate(width/4, height/4);    //location orb is drawn at
  if (dist(mouseX, mouseY, s1.location.x, s1.location.y) < 100)    //mousepressed function to move through stages
  {
    fill(#DE0D0D);
    textSize(24);
    text("Christmas Classics", 0, 0);

    if (mousePressed)
    {
      state = STATE_CLASSIC;
    }
  }
  s1.drawParticles();
  popMatrix();

  pushMatrix();      //hit orb
  translate(3*width/4, height/4);    //location
  if (dist(mouseX, mouseY, s2.location.x, s2.location.y) < 100)    //hit box
  {
    fill(#DE0D0D);
    textSize(24);
    text("Christmas Hits", 0, 0);

    if (mousePressed)
    {
      state = STATE_HITS;
    }
  }
  s2.drawParticles();
  popMatrix();

  pushMatrix();      //jazz orb
  translate(width/4, 3*height/4);    //location
  if (dist(mouseX, mouseY, s3.location.x, s3.location.y) < 100)    //hit box
  {
    fill(#DE0D0D);
    textSize(24);
    text("Smooth Christmas", 0, 0);

    if (mousePressed)
    {
      state = STATE_SMOOTH;
    }
  }
  s3.drawParticles();
  popMatrix();

  pushMatrix();      //country orb
  translate(3*width/4, 3*height/4);    //location
  if (dist(mouseX, mouseY, s4.location.x, s4.location.y) < 100)    //hit box
  {
    fill(#DE0D0D);
    textSize(24);
    text("Christmas Country", 0, 0);

    if (mousePressed)
    {
      state = STATE_COUNTRY;
    }
  }
  s4.drawParticles();
  popMatrix();
}

//ornament to quit

class Ornament
{
  PVector location, size;

  public Ornament(int x, int y, int w, int h)
  {
    location = new PVector(x, y);
    size = new PVector(w, h);
  }

  void draw()
  {
    pushStyle();
    rectMode(CENTER);
    image(ornament, location.x, location.y, size.x, size.y);
    popStyle();

    if (dist(mouseX, mouseY, location.x, location.y) < size.x)
    {
      fill(255);
      textSize(18);
      text("Click here to return to the menu", location.x + 30, location.y, 150, 600);
      
      if(mousePressed)
      {
      state = STATE_MAIN;
      flakes.clear();    //clear snowflakes when returning to main menu
      }
    }
  }
}

//class for snowflakes in stream screens

class Snowflakes
{
  PVector location, velocity;

  Snowflakes(float x, float y)
  {
    location = new PVector(x, y);
    velocity = new PVector(random(-1, 1), random(0, 3));
  }

  void draw()
  {
    pushStyle();
    ellipseMode(CENTER);
    fill(255);
    noStroke();
    location.add(velocity);
    
    pushMatrix();
    translate(location.x, location.y);
    ellipse(0, 0, 3, 3);
    popMatrix();
    popStyle();
  }
}

//orbs to click on in the menu

class snowglobe
{
  PVector location;
  int size, fillcolor, numPart;
  float rot, sphereRad;
  float[] thetaX, thetaY, thetaZ;

  public snowglobe(int x, int y)
  {
    location = new PVector(x, y);
    size = 100;
    fillcolor = 255;
    numPart = 160;
    sphereRad = 2;
    thetaX = new float[numPart];
    thetaY = new float[numPart];
    thetaZ = new float[numPart];

    for (int i = 0; i < numPart; i++)
    {
      thetaX[i] = random(360);
      thetaY[i] = random(360);
      thetaZ[i] = random(360);
    }
  }

  void drawParticles()
  {
    for (int i = 0; i < numPart; i++)
    {
      pushMatrix();
      rotateX(radians(thetaX[i] + rot));
      rotateY(radians(thetaY[i] + rot));
      rotateZ(radians(thetaZ[i]));
      translate(0, size); //size

        pushStyle();
      noStroke();
      fill(fillcolor);
      sphereDetail(7);
      sphere(sphereRad);
      popStyle();

      popMatrix();
      rot += .005;
      mouse();

      if (key == ' ')
      {
        size = 100;
      }
    }
  }

  void mouse()
  {
    if (dist(mouseX, mouseY, location.x, location.y) < size)
    {
      rot += .01;
    }
  }
}



