
//Mia Rosado, images from Google

String image0 = "bunny.jpg";
String image1 = "clock.jpg";
String image2 = "owl.jpg";
String image3 = "heart.jpg";
String image4 = "img1.jpg";
String image5 = "img2.jpg";
String image6 = "mouse.jpg";
String image7 = "Red_Handprint.jpg";
String image8 = "star.png";
String image9 = "eye.jpg";

String[] images = {"image 0", "image 1", "image 2", "image 3", "image 4", "image 5", "image 6", "image 7", "image 8", "image 9"};
PImage[] myimages = new PImage[10];

int backgroundIndex = 0;
float timer = 1.0;
int timerplay = 0; 

 
 void setup()
{
  background(0,0,0);
  size(800,600);
  frameRate(15); 
  myimages[0] = requestImage("bunny.jpg");
  myimages[1] = requestImage("clock.jpg");
  myimages[2] = requestImage("owl.jpg");
  myimages[3]= requestImage("heart.jpg");
  myimages[4] = requestImage("img1.jpg");
  myimages[5]= requestImage("img2.jpg");
  myimages[6] = requestImage("mouse.jpg");
  myimages[7]= requestImage("Red_Handprint.jpg");
  myimages[8]= requestImage("star.png");
  myimages[9]= requestImage("eye.jpg");
 
  
}

void draw()
{ background(255);
  timer = timer + 1.0 / 30.0;
  
  if (timer > 0.05)
    {
    backgroundIndex = backgroundIndex + 1;
    timer = 0;
  }
   
  if (backgroundIndex < 0 || backgroundIndex >= myimages.length)
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

void keyReleased()
{
  if (key == ' ')
  {
    backgroundIndex = backgroundIndex + int(random(10));
  }
  if (keyCode == LEFT)
  {
    timerplay = 0;
    backgroundIndex = backgroundIndex - 1;
    timer = 0;
  }
  if (keyCode == RIGHT)
  {
    timerplay = 1;
    backgroundIndex = backgroundIndex + 1;
    timer = 0;
  }
}

//Mia, your coding is *sh!t*


