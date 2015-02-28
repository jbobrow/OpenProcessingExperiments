
/*
This video gets the hue from the pizxel from the center of the video capture and applies it to the entire video. 
The Saturation increases over time.
*/

import processing.video.*;
Capture video;

int camWidth = 40;
int camHeight = 30;
int fps = 15;
int newx = 0;
int newy = 0;
int xjump = 18;
int yjump = 18;
int drift = 8; 


float sat = 10;

      
float opacity = 50;
float randomRadius = random(20,30);

int[] last = new int[camWidth*camHeight];

int colorCount = 0;
int sizeCount = 0;


void setup()
{
  background(0);
  colorMode(HSB, 100);
  smooth();
  size(camWidth*xjump,camHeight*yjump,P2D);
  frameRate(fps);
  //declare a variable of type capture called video
  //and sends it 4 parameters: this, width, height, framerate in seconds
  
     video = new Capture(this, camWidth, camHeight,fps); 
   
   //initilizing the array
   
   for(int i = 0; i< last.length; i++)
  {
    last[i] = 0;
  }
}



void draw()
{
 //filter(BLUR);
  video.loadPixels();
  loadPixels();
  //Picks a rowo
  for(int y=0; y < video.height; y++)
  {
    //runs through every pixel in the row
    for(int x=video.width-1; x>=0;x--)
    {
      //picks the pixel in the array
      int location = x+y * video.width;
      color c = video.pixels[location];
      
      
      color middle = video.pixels[((video.width*video.height)/2)-(video.width/2)];
      
      pixels[(video.width*video.height)/2] = 255;
      
      float h = hue(c);
      float s = saturation(c);
      float br = brightness(c);
      
      float midHue = hue(middle); 
      float midSaturation = saturation(middle);
      float midBrightness = brightness(middle);
     

       
      fill(midHue, midSaturation, midBrightness);
      rect(0,0,40,40);
      drawCircles(midHue,sat,br);

      
      newx+=xjump;
      
      last[location] = video.pixels[location];

    }
    newx = 0;
    newy+=yjump;
  }
  
  newy = 0;
  
  //let Processing know we're done playing with the pixel[] array
  video.updatePixels();  
  updatePixels();

  sat++;
  println(sat);
  if(sat == 255)
  {
    sat = 10;
  }


}

void captureEvent(Capture v)
{
   v.read(); 
}


void drawCircles(float r,float g, float b)
{
  
  fill(r,g,b,opacity);
  noStroke();
  //ellipse(newx+random(rectdrift),newy+random(rectdrift),xjump-random(rectdrift),yjump-random(rectdrift));
  ellipse(newx+random(drift),newy+random(drift),randomRadius,randomRadius);


}



