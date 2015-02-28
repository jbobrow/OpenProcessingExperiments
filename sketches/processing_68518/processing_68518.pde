
//for logo
PImage logoImage = new PImage();

//for bouncing logos
int numOfAppleLogos = 5;
float[] speedX = new float[numOfAppleLogos];
float[] speedY = new float[numOfAppleLogos];
float[] appleXPos = new float[numOfAppleLogos];
float[] appleYPos = new float[numOfAppleLogos];
PImage[] appleLogoImgs = new PImage[numOfAppleLogos];
float gravity = 0.3;

//for devices
int numOfDeviceImage = 6;
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
    background(255);
    size (400, 400);
    smooth();
    //loading the logo image for first screen
    logoImage = loadImage("apple.png");
    //displaying the logo image at (155, 120)
    image( logoImage, 155, 120 );
    initializeDeviceNames();
    setupAppleLogo();
}

void draw()
{
    //if mouse is clicked 7 times display "What's Next?" and
    if(mouseNumOfClicked == 7)
     {
        background(255);
        font = createFont("Myriad Pro", 40);
        textFont(font);
        fill(0);
        text("What's next?", 75, 200);

        
        //create small apple logos that bounces throughout the screen
        for(int i = 0; i < numOfAppleLogos; i++)
        {
            //displays apple logo images
            image(appleLogoImgs[i % numOfAppleLogos], appleXPos[i], appleYPos[i]);
            //adds speed to x position and y position
            appleXPos[i] += speedX[i];
            appleYPos[i] += speedY[i];
            
            //adds speed to gravity so bouncing slows down 
            speedY[i] += gravity;
            
            // when logo bounces off the wall, slow them down
            if (appleYPos[i] >= height-25 || appleYPos[i] <= 20 ) {
              speedY[i] *= -0.95;
            }
            if (appleXPos[i] >= width-20 || appleXPos[i] <= 0 ) {
              speedX[i] *= -1;
            }
        }
     }
}

//loads small apple logo images (giving positions and speed for bouncing purposes)
void setupAppleLogo()
{
    for(int i = 0; i < numOfAppleLogos; i++)
    {
        appleXPos[i] = int(random(10, 390));
        appleYPos[i] = int(random(150, 350));
        speedX[i] = 3;
        speedY[i] = 5;
    }
    
    for(int i = 1; i < numOfAppleLogos+1; i++)
    {
        appleLogoImgs[i-1] = loadImage("apple"+ i + ".png");
    }
}

// declaring name of images in deviceNames array
void initializeDeviceNames()
{
    deviceNames[0] = "ipodshuffle.jpg";
    deviceNames[1] = "ipodnano.jpg";
    deviceNames[2] = "ipodclassic.jpg";
    deviceNames[3] = "ipodtouch.jpg";
    deviceNames[4] = "iphone.jpg";
    deviceNames[5] = "iphone4.jpg";
}

// declaring mousePressed function
void mousePressed ()
{
    // if mouse button clicked is left button
    if (mouseButton == LEFT)
    {
        // increase the number of mouse clicked by 1
         mouseNumOfClicked++;
         // go through the array of device images
         for(int i=1; i < numOfDeviceImage+1; i++)
         {
             // for each click, display different devices
             if (mouseNumOfClicked == i)
             {
                 deviceImages[mouseNumOfClicked-1] = loadImage(deviceNames[mouseNumOfClicked-1]);
                 image(deviceImages[mouseNumOfClicked-1], 0, 0);
             }
         }
     }
}

