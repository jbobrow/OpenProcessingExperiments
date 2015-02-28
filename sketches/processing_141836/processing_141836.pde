
String image1 = "i1";
String image2 = "i2";
String image3 = "i3";
String image4 = "i4";
String image5 = "i5";
String image6 = "i6";
String image7 = "i7";
String image8 = "i8";
String image9 = "i9";
String image10 = "i10";
String image11 = "i11";
String image12 = "i12";
String image13 = "i13";

String[] images = {
"i1","i2","i3","i4","i5","i6","i7","i8","i9","i10","i11","i12","i13"
};

PImage[] myimages = new PImage[13];

int backgroundIndex = 0;
int imgStopStart = 1;
float timer = 1;

void setup()
{
  size(600,600);
  frameRate(30);
  myimages[0] = requestImage("BG1.png");
  myimages[1] = requestImage("BG2.png");
  myimages[2] = requestImage("BG3.png");
  myimages[3] = requestImage("BG4.png");
  myimages[4] = requestImage("BG5.png");
  myimages[5] = requestImage("BG6.png");
  myimages[6] = requestImage("BG7.png");
  myimages[7] = requestImage("BG8.png");
  myimages[8] = requestImage("BG9.png");
  myimages[9] = requestImage("BG10.png");
  myimages[10] = requestImage("BG11.png");
  myimages[11] = requestImage("BG12.png");
  myimages[12] = requestImage("BG13.png");
}

void draw()
{
  background(#000000);
  
  if (imgStopStart == 1)
  {
    timer -= (1.0 / 30.0);
  }
  if (timer <= 0)
  {
    backgroundIndex += 1;
    timer = 1;
  }
  
  if (backgroundIndex >= myimages.length || backgroundIndex < 0)
  {
    backgroundIndex = 0;
  }
  if (myimages[backgroundIndex].width > 0)
  {
    drawLoadedImage(myimages[backgroundIndex], 0, 0, width, height);
  }
}
 
void drawLoadedImage(PImage aimage, float ax, float ay, float aw, float ah)
{
  if (aimage.width > 0)
  {
    image(aimage, ax, ay, aw, ah);
  }
}

void keyPressed()
{
  if (key == '1')
  {
    backgroundIndex = backgroundIndex + 100;
  }
  if (key == '2')
  {
    backgroundIndex = backgroundIndex + int(random(10));
  }
}

void keyReleased()
{
  if (keyCode == LEFT)
  {
    imgStopStart = 0;
    backgroundIndex = backgroundIndex - 1;
    timer = 1;
  }
  if (keyCode == RIGHT)
  {
    imgStopStart = 0;
    backgroundIndex = backgroundIndex + 1;
    timer = 1;
  }
  if (keyCode == UP || keyCode == DOWN)
  {
    imgStopStart = 1;
    backgroundIndex = backgroundIndex + 1;
    timer = 1;
  }
}


