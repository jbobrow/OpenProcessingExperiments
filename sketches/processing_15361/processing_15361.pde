
/**
 * Animated Sprite (Shifty + Teddy)
 * by <a href="http://www.presstube.com">James Patterson</a>. 
 * 
 * Press the mouse button to change animations.
 * Demonstrates loading, displaying, and animating GIF images.
 * It would be easy to write a program to display 
 * animated GIFs, but would not allow as much control over 
 * the display sequence and rate of display. 
 * 
 * Created 28 January 2003
 */
 
AniSprite animation1, animation2;
float xpos, ypos;
float drag = 1;

void setup()
{
  size(300,300);
  background(255, 204, 0);
  frameRate(12);
  animation1 = new AniSprite("hmm_00", 48);
  animation2 = new AniSprite("shmm_00", 48);
}

void draw()
{ 
  float difx = 250-xpos;
  if(abs(difx) > 1.0) {
    xpos = xpos + difx/drag;
    xpos = constrain(xpos, 0, width);
  }

  // Display the sprite at the position xpos, ypos
  if(mousePressed) {
    background(160, 213, 252);
    animation1.display(xpos-animation1.getWidth(), ypos);
  } else {
    background(2, 34, 108);
    animation2.display(xpos-animation1.getWidth(), ypos);
  }
}


// Class for animating GIFs

class AniSprite
{
  PImage[] ani;
  int frame;
  int numFrames;
  
  AniSprite(String imageName, int frameCount) {
    numFrames = frameCount;
    ani = new PImage[numFrames];
    loadImages(imageName);
  }

  void loadImages(String name) {
    for(int i=0; i<numFrames; i++) {
      String imageName = name + ((i < 10) ? "0" : "") + i + ".gif";
      ani[i] = loadImage(imageName);
    }
  }

  void display(float xpos, float ypos)
  {
    frame = (frame+1)%numFrames;
    image(ani[frame], xpos, ypos);
  }
  
  int getWidth() {
    return ani[0].width;
  }

}

