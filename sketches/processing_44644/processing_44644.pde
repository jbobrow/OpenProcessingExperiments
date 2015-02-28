
class MarioAnimated
{
  int imageIndex = 0;
  int maxImages = 9; // total number of images
  PImage[] imagesRight = new PImage[9];
  PImage[] imagesLeft = new PImage[9];
  PImage flyimage;
  int framePlayed = 1;
  float xpos;
  float ypos;
  float width;
  float height;

  MarioAnimated(float tempxpos, float tempypos, float widthScreen, float heightScreen) 
  {
    xpos = tempxpos;
    ypos = tempypos;
    width = widthScreen;
    height = heightScreen;
    xpos = 100;
    ypos = height-150;
    //Loading images into an array
    for (int i = 0; i<imagesRight.length; i++) 
    {
      imagesRight[i] = loadImage("r"+i+".png");
      imagesLeft[i] = loadImage("l"+i+".png");
       flyimage = loadImage("fly.png");
    }
  }

  void display(boolean orientation, boolean standStill) {
    if (standStill)
      image(imagesRight[0], xpos, ypos);
    else
    {
    if (orientation)
       image(imagesRight[framePlayed], xpos, ypos);
     else
       image(imagesLeft[framePlayed], xpos, ypos);
       framePlayed = (framePlayed+1) % imagesLeft.length;
    //   if framePlayed 
     // if (framePlayed==1)
   //     framePlayed=2;
   //   else
    //    framePlayed=1;
    }
  }

  void run(float xDirection) 
  {
    this.xpos+=xDirection;
    if (xpos > width-60) {  // DEAL WITH THIS!!!!!!
      xpos = width-80;
    }
     if (xpos < 60) {
      xpos = 80;
    }
  }

  void fly(float yDirection) 
  {
    this.ypos+=yDirection;
    //image(flyimage,xpos,ypos,110,156);
   
    if (ypos > height-140) {
      ypos = height-150;
    }
    if (ypos < 80) {
      ypos = 80;
    }
  }
}


