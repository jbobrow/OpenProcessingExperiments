
PImage img;
int copyX = 20;
int copyY = 20;
int srcWidth;
int srcHeight;
int destX = 40;
int destY = 40;
int destWidth;
int destHeight;

int col = 80;
int row = 80;

int[] imgArray = new int[10];

void setup()
{
  size(800, 800);
  smooth();
  img = loadImage("computer_small.jpg");
  background(255);
  //noCursor();
  //frameRate(100);
}

void draw()
{
  srcWidth = 40;
  srcHeight = 40;  
  destWidth = 40;
  destHeight = 40;  

  for(int i = 0; i < col; i++)
  {
    for(int j = 0; j < col; j++)
    {
      //copy(img, i*int(random(0,40)), j*int(random(0,40)), srcWidth, srcHeight, i*40, j*40, destWidth, destHeight);
      //copy(img, i*40, j*40, srcWidth, srcHeight, i*40, j*40, destWidth, destHeight); //full picture
      //copy(img, i*20, j*20, srcWidth, srcHeight, i*40, j*40, destWidth, destHeight);
      copy(img, i*copyX, j*copyY, srcWidth, srcHeight, i*destX, j*destY, destWidth, destHeight);
    }
  }
}

void keyPressed()
{
  if(key == 32)
  {
    save("imCutter.jpg");
  }
  
  if(key == '1')
  {
    destX = destY = 40;
    copyX = copyY = 20;
  }
  if(key == '2')
  {
    destX = destY = 10;
    copyX = copyY = 5;
  }
  if(key == '3')
  {
    background(255);
    destX = destY = 80;
    copyX = copyY = 40;
  }
  
  //println(destX);
}

