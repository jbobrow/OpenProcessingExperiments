
import ddf.minim.*;

Minim minim;
AudioPlayer[] space = new AudioPlayer[8];  // array of audio players
AudioPlayer silence;  // background noise
int currentAudio = 0;  // audio array index

PImage[] stars = new PImage[11];  // image array
int[][] activeStripes = new int[11][5];  // array of image properties


void setup()
{
  size(800,600);  // set screen size
  background(0);  // black background
  minim = new Minim(this);  // instantiating audio class
  silence = minim.loadFile("emptySpace.wav");
  
  for(int i=0; i<space.length; i++)  // loading audio files
  {
    space[i] = minim.loadFile("space"+i+".wav");
  }
  
  for(int i=0; i<stars.length; i++)  // loading images into the array
  {
    stars[i] = loadImage("galaxyStripe00"+i+".png");
  }
}

void draw()
{
  background(0);  // refresh background
  drawSpace();  // draw images to screen
  if(!silence.isPlaying())
  {
    silence.rewind();
    silence.play();
  }
}

void mousePressed()
{
  currentAudio = int(random(8));  // randomise audio track to play  
  space[currentAudio].cue(0);  // rewind
  space[currentAudio].play();  // play
  setupStripe();  // setup new image properties
}

void setupStripe()  // activates an image stripe and sets coordinates and direction
{
  boolean inUse = true;
  int next = 0;  // array index
  for(int i=0; i<stars.length; i++)  // check the array for inactive image
  {
    if(activeStripes[i][0] == 0)
    {
      inUse = false;
    }
  }
  
  if(!inUse)  // if inactive image found
  {
    next = int(random(11));  // generate a random index
    if(activeStripes[next][0] == 1)  // if image with this index is active
    {
      setupStripe();  // do over
    }
    else  // if not, setup properties
    {
      activeStripes[next][0] = 1;  // active image state
      activeStripes[next][1] = (int(random(2))*2-1);  // direction
      activeStripes[next][2] = int(random(height-100));  // y position
      activeStripes[next][3] = activeStripes[next][1]*(-width);  // x position
      activeStripes[next][4] = int(random(1,3));  // random speed
    }
  }
}

void drawSpace()  // draw active images to screen
{
  for(int i=0; i<stars.length; i++)  // itirate through the array
  {
    if(activeStripes[i][0] == 1)  // if the image is active
    {
      image(stars[i],activeStripes[i][3],activeStripes[i][2]);  // draw image
      activeStripes[i][3] += activeStripes[i][1] * activeStripes[i][4];  // increment x position
    }
    if(activeStripes[i][3]>width || activeStripes[i][3] < -width)  // when image reaches end of path
    {
      activeStripes[i][0] = 0;  // deactivate image
    }
  }
}

