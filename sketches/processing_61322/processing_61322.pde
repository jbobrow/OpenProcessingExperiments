
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

AudioPlayer bgmusic;
AudioPlayer seagulls;
AudioPlayer splash;
AudioPlayer dolphinz;
Minim minim;

PShape waveTop;
PShape waveBottom;
PShape dolphin;
PShape seagull1, seagull2, seagull3, seagull4, seagull5, seagull6, bird;
PImage bg, butW, butD, butS, butE;

boolean isWave = false;
boolean isDolphin = false;
boolean isBird = false;
boolean isErase = false;

boolean overWave = false;
boolean overDolphin = false;
boolean overBird = false;

int butWX, butWY;     // Wave Button
int butDX, butDY;     // Dolphin Button
int butSX, butSY;     // Seagull Button
int butEX, butEY;     // Eraser Button

int butWSize = 85;    // Size of Wave Button
int butDSize = 85;    // Size of Dolphin Button
int butSSize = 85;    // Size of Seagull Button
int butESize = 85;    // Size of Eraser Button

void setup()
{  
  // Background 
  size(800, 600);
  bg = loadImage("bg.jpg");
  bg.resize(800, 600);
  background(bg);
  smooth();

  // Audio
  minim = new Minim(this);
  bgmusic = minim.loadFile("OceanGirl.wav");
  bgmusic.play();
  bgmusic.loop();
  seagulls = minim.loadFile("seagull.wav");
  splash = minim.loadFile("splash.wav");
  dolphinz = minim.loadFile("dolphin.wav");

  // Button Positions
  butWX = 20;
  butDX = 20;
  butSX = 20;
  butEX = 20;
  butWY = 20;
  butDY = 105;
  butSY = 195;
  butEY = 285;

  // Load images
  waveTop    = loadShape("waves_top.svg");
  waveBottom = loadShape("waves_bottom.svg");
  dolphin    = loadShape("dolphin.svg");
  seagull1   = loadShape("seagull1.svg");
  seagull2   = loadShape("seagull2.svg");
  seagull3   = loadShape("seagull3.svg");
  seagull4   = loadShape("seagull4.svg");
  seagull5   = loadShape("seagull5.svg");
  seagull6   = loadShape("seagull6.svg");

  butW       = loadImage("butW.gif");
  butD       = loadImage("butD.gif");
  butS       = loadImage("butS.gif");
  butE       = loadImage("butE.gif");
}

// DRAW
void draw()
{

  
  image(butW, butWX, butWY, butWSize, butWSize);    // Waves Button
  image(butD, butDX, butDY, butDSize, butDSize);    // Dolphin Button
  image(butS, butSX, butSY, butSSize, butSSize);    // Seagull Button
  image(butE, butEX, butEY, butESize, butESize);    // Erase Button

  update(mouseX, mouseY);
  drawWave(mouseX, mouseY);
  drawDolphin(mouseX, mouseY);
  drawBird(mouseX, mouseY);
}     

// UPDATE
void update(int x, int y)
{
  if (overWave(butWX, butWY, butWSize)) {
    isWave = true;
    isDolphin = false;
    isBird = false;
    isErase = false;
  } 
  else if (overDolphin(butDX, butDY, butDSize)) {
    isWave = false;
    isDolphin = true;
    isBird = false;
    isErase = false;
  } 
  else if (overBird(butSX, butSY, butSSize)) {
    isWave = false;
    isDolphin = false;
    isBird = true;
    isErase = false;
  } 
  else if (overErase(butEX, butEY, butESize)) {
    isWave = false;
    isDolphin = false;
    isBird = false;
    isErase = true;
    background(bg);
    bgmusic.cue(0);
    splash.pause();
    seagulls.pause();
    dolphinz.pause();
  }
}





// Button Functions
boolean overWave(int x, int y, int diameter)
{
  if (mousePressed && mouseX >= x && mouseX <= x+butWSize &&
    mouseY >= y && mouseY <= y+butWSize)
  {
    overWave = true;
    return true;
  } 
  else
  {
    overWave = false;
    return false;
  }
}

boolean overDolphin(int x, int y, int diameter)
{
  if (mousePressed && mouseX >= x && mouseX <= x+butDSize &&
    mouseY >= y && mouseY <= y+butDSize)
  {
    overDolphin = true;
    return true;
  } 
  else
  {
    overDolphin = false;
    return false;
  }
}

boolean overBird(int x, int y, int diameter)
{
  if (mousePressed && mouseX >= x && mouseX <= x+butSSize &&
    mouseY >= y && mouseY <= y+butSSize)
  {
    seagulls.cue(0);
    seagulls.play();
    overBird = true;
    return true;
  } 
  else
  {
    overBird = false;
    return false;
  }
}

boolean overErase(int x, int y, int diameter)
{
  if (mousePressed && mouseX >= x && mouseX <= x+butESize &&
    mouseY >= y && mouseY <= y+butESize)
  {
    return true;
  } 
  else
  {
    return false;
  }
}





// DRAW FUNCTIONS
void drawWave(int X, int Y)
{
  if (overWave == false)
  {
    if (isWave)
    {
      if (mousePressed)
      {
        //splash.play();
        splash.loop(3);
        shape(waveBottom, X, Y);
        shape(waveTop, X, Y);
        frameRate(8);
      }
    }
  }
}

void drawDolphin(int X, int Y)
{
  if (overDolphin == false)
  {
    if (isDolphin)
    {
      if (mousePressed)
      {
        //dolphinz.play();
        dolphinz.loop(3);
        shape(dolphin, X, Y);
        //frameRate(10);
      }
    }
  }
}

void drawBird(int X, int Y)
{
  if (overBird == false)
  {
    if (isBird)
    {
      if (mousePressed)
      {
        // Handle which seagull to draw
        PShape [] birds = {
          seagull1, seagull2, seagull3, seagull4, seagull5, seagull6
        };
        int index = int(random(birds.length));
        bird = birds[index];
  
        shape(bird, X, Y);
        frameRate(5);
      }
    }
  }
}  


// END AUDIO
void stop()
{
  // always close Minim audio classes when you are done with them
  bgmusic.close();
  seagulls.close();
  splash.close();
  dolphinz.close();
  minim.stop();
  
  super.stop();
}

