
/**************************************************************

  TIME WARP effect : 

  This sketch is taking frames from a video and creates a time 
  warp effect by delaying the reading speed of every lines of 
  pixels over time.

  You need to place consecutive frames of a video in a folder
  and indicate the path of it in the setup function

  You can find a full video made with algorithm here :
  http://vimeo.com/32570551

  by M. Le Goff - 2011

**************************************************************/

PImage[] myFrames;
int NUMBEROFFRAMES;
int NUMBEROFSLICES;
int FRAMEWIDTH;
int FRAMEHEIGHT;
float[] frameCounter;

void setup() 
{
  //Size of the comp
  size(700, 400, P2D);
  //FrameRate
  frameRate(24);
  //Black background
  background(0);
  //Setup your number of frames
  NUMBEROFFRAMES = 99;
  //Create an array and load the frames
  myFrames = new PImage[NUMBEROFFRAMES];  
  for ( int i = 0; i< NUMBEROFFRAMES; i++ )
  {   
     if( i<10-1 )   //---->> Put your own images name here <<----//
      myFrames[i] = loadImage("sequence000"+ (i+1)+ ".jpg");
     else if( i<100-1)
      myFrames[i] = loadImage("sequence00"+ (i+1)+ ".jpg");  
     else
      myFrames[i] = loadImage("sequence0"+ (i+1)+ ".jpg");      
  }
  //Setup variables
  NUMBEROFSLICES = myFrames[0].height;
  FRAMEWIDTH     = myFrames[0].width;
  FRAMEHEIGHT    = myFrames[0].height;
  //Reset frame counters
  frameCounter = new float[NUMBEROFSLICES]; 
  for(int i=0; i<NUMBEROFSLICES; i++)
  {
    frameCounter[i]=0;
  }
}

void draw() 
{
  PImage img = new PImage(FRAMEWIDTH,FRAMEHEIGHT);      
  for(int slice=0; slice<NUMBEROFSLICES; slice++)
  {
    //Draw every lines of the pictures by taking a singular line from the frames
    int SliceHeight = myFrames[int(frameCounter[slice])].height/NUMBEROFSLICES;
    int offset = slice*(SliceHeight*FRAMEWIDTH);
    for(int i=offset; i<SliceHeight*FRAMEWIDTH + offset; i++)
    {
      img.pixels[i] = myFrames[int(frameCounter[slice])].pixels[i];
    }
    //Increment the counters to create the timewarping effect 
    frameCounter[slice] = (frameCounter[slice]+0.5+slice*0.0001)%NUMBEROFFRAMES;
  }
  //Setup color (B/W) and alpha to avoid aliasing
  tint(255, 20);
  //Center the image
  imageMode(CENTER);
  //Display the image
  image(img,width/2,height/2);
}




