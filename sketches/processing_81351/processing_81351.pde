
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/68518*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
//for logo
PImage img1; PImage img2;
PImage logoImage = new PImage();

//for devices
int numOfDeviceImage = 8;
//creating device images
PImage[] deviceImages = new PImage[numOfDeviceImage];
//creating name of devices
String[] deviceNames = new String[numOfDeviceImage];

//track number of mouse clicked
int mouseNumOfClicked = 0;

// creating font
PFont font = new PFont();

void setup()
{
    img1 = loadImage("cake.jpg");
    img2 = loadImage("kids3.jpg");
    
    size (600, 500);
    background(img1);
    smooth();
    //loading the first candle
    logoImage = loadImage("candle8.png");
    //positioning goes here
    image( logoImage, 0, 0 );
    initializeDeviceNames();
}

void draw()
{
    //mouse is clicked 9 times
    if(mouseNumOfClicked == 9)
     {
        background(img2);
     }
}




// declaring name of images in deviceNames array
void initializeDeviceNames()
{
    deviceNames[0] = "candle7.png";
    deviceNames[1] = "candle6.png";
    deviceNames[2] = "candle5.png";
    deviceNames[3] = "candle4.png";
    deviceNames[4] = "candle3.png";
    deviceNames[5] = "candle2.png";
    deviceNames[6] = "candle1.png";
    deviceNames[7] = "littleus2.jpg";
}

// declaring mousePressed function
void mousePressed ()
{
    // if mouse button clicked is left button
    if (mouseButton == LEFT)
    {
        // increase the number of mouse clicked by 1
         mouseNumOfClicked++;
         // go through the array of candle images
         for(int i=1; i < numOfDeviceImage+1; i++)
         {
             // for each click, display more candles
             if (mouseNumOfClicked == i)
             {
                 deviceImages[mouseNumOfClicked-1] = loadImage(deviceNames[mouseNumOfClicked-1]);
                 image(deviceImages[mouseNumOfClicked-1], 0, 0);
             }
         }
     }
}

