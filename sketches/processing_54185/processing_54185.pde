
/*
Creates an images made up of circles that vary in size and opacity which change hue based on key presses
n= makes image normal
a = makes the screen black

c = makes image cyan
m = makes image magenta
y = makes image yellow
b = makes the image blue
g = makes it green
r = makes it red



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
boolean noR = false; 
boolean noG = false; 
boolean noB = false; 
float r = 0;
float g = 0; 
float b = 0;   
      
int variance = 2;
float opacity = 50;
float randomRadius = random(20,30);

int[] last = new int[camWidth*camHeight];

int colorCount = 0;
int sizeCount = 0;


void setup()
{
  background(0);
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
  //Picks a rowo
  for(int y=0; y < video.height; y++)
  {
    //runs through every pixel in the row
    for(int x=video.width-1; x>=0;x--)
    {
      //picks the pixel in the array
      int location = x+y * video.width;
      color c = video.pixels[location];
       r = red(c); 
       g = green(c); 
       b = blue(c); 
      
      float rl = red(last[location]); 
      float gl = green(last[location]); 
      float bl = blue(last[location]);    
     
      drawCircles(r,g,b);
      
      

      
      newx+=xjump;
      
      last[location] = video.pixels[location];

    }
    newx = 0;
    newy+=yjump;
  }
  
  newy = 0;
  
  //let Processing know we're done playing with the pixel[] array
  video.updatePixels();  

//runs through the seven different color settings  
colorCount++;
//println(colorCount);
if(colorCount == 350)
{
  colorCount = 0;
}

//runs through the nine different size settings
sizeCount++;
println(sizeCount);
if(sizeCount == 900)
{
  sizeCount = 0;
}

}

void captureEvent(Capture v)
{
   v.read(); 
}


void drawCircles(float r,float g, float b)
{
  
  
  //DETERMINES THE COLOR OF THE CIRICLES

  //Makes the image red
  if(colorCount > 50 && colorCount <= 100)
  {
    fill(r,0,0,opacity); 
  }
  
  //makes the image yellow
  else if(colorCount > 100 && colorCount <= 150)
  {
     fill(r,g,0,opacity);
  }
  
  //makes the image green
  else if(colorCount > 150 && colorCount <= 200)
  {
    fill(0,g,0,opacity); 

  }
 
  //makes the image cyan
  else if(colorCount > 200 && colorCount <= 250)
  {
    fill(0,g,b,opacity);
  }
  
   //makes the image blue
  else if(colorCount > 250 && colorCount <= 300)
  {
     fill(0,0,b,opacity); 

  }
  //makes the image magenta
  else if(colorCount > 300 && colorCount <= 350)
  {
    fill(r,0,b,opacity);

  }

  //returns the image to normal
  else
  {
     fill(r,g,b,opacity); 
  }
  
  
  
  //Determines the size of the circles
  if(sizeCount > 0 && sizeCount <= 100)
  {
    randomRadius = 10;
  }
  
  else if(sizeCount > 100 && sizeCount <= 200)
  {
    randomRadius = 20;
  }
  
  else if(sizeCount > 200 && sizeCount <= 300)
  {
    randomRadius = 30;
  }
  
  else if(sizeCount > 300 && sizeCount <= 400)
  {
    randomRadius = 40;
  }
  
  else if(sizeCount > 400 && sizeCount <= 500)
  {
    randomRadius = 50;
  }
  
  else if(sizeCount > 500 && sizeCount <= 600)
  {
    randomRadius = 60;
  }
  
  else if(sizeCount > 600 && sizeCount <= 700)
  {
    randomRadius = 70;
  }
  
  else if(sizeCount > 700 && sizeCount <= 800)
  {
    randomRadius = 80;
  }
  
  else if(sizeCount > 800 && sizeCount <= 900)
  {
    randomRadius = 90;
  }
  noStroke();
  //ellipse(newx+random(rectdrift),newy+random(rectdrift),xjump-random(rectdrift),yjump-random(rectdrift));
  ellipse(newx+random(drift),newy+random(drift),randomRadius,randomRadius);


}



