
//copyright Yoon-ji Kim 2014
//51-257 A
//HW 9: Arrays and Strings

float [] xVals = {25, 50, 75, 100, 125, 150, 175, 200};
float [] yVals = {0, 0, 0, 0, 0, 0, 0, 0};
float [] deltVals = {2, 4, 6, 8, 10, 12, 14, 16};

//string that moves across screen
String[] strX = {"yes", "ter", "day"};
//string that falls vertically down screen
String strY;

final int MAX_IMG = 1;
PImage img;
PImage[] imgArray;

void setup()
{
  size(400, 400);
  background(0);
  frameRate(15);
  textSize(16);
  smooth();
  
  strY = "letitbe";
  
  imageMode(CENTER);
  imgArray = new PImage[MAX_IMG];
  initImgArray(imgArray);
  showImage();
}

void draw()
{
  rain1(strY);
  rain2(strY);
  corner(strX);
}

void showImage()
{
  for(int i=0; i<imgArray.length; i++)
  {
    image(imgArray[i], 200, 200, width, height);
  }
}
 
void initImgArray(PImage [ ] imgArray)
{
  for(int i = 0; i<imgArray.length; i++)
  {
    String imageName = "0.jpg";
    imgArray [i] = loadImage(imageName);
  }
}

void rain1(String s)
{
  for(int i = 0; i < s.length(); i++)
  {
    yVals[i%yVals.length] += deltVals[i%deltVals.length];
    if(yVals[i%yVals.length] > height)
    {
      yVals[i%yVals.length] = 0;
    }
    text(s.charAt(i), xVals[i%xVals.length], yVals[i%yVals.length]);
    fill(255, 253, 252, 100);
  }
}

void rain2(String s)
{
  float [] xVals = {225, 250, 275, 300, 325, 350, 375, 400};
  for(int i = 0; i < s.length(); i++)
  {
    yVals[i%yVals.length] += deltVals[i%deltVals.length];
    if(yVals[i%yVals.length] > height)
    {
      yVals[i%yVals.length] = 0;
    }
    text(s.charAt(i), xVals[i%xVals.length], yVals[i%yVals.length]);
  }
}

void corner(String [] anyArray)
{
 for(int i = 0; i < anyArray.length; i++)
  {
    text(anyArray[i], 4*width/5, 4*height/5+i*15);
    fill(245, 117, 74);
  } 
}

void keyPressed()
{
  if(key == ' ')
  {
    setup();
  }
}


