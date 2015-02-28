
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

int variance = 2;
float opacity = random(50);
float randomRadius = random(10,30);

int[] last = new int[camWidth*camHeight];

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
      float r = red(c); 
      float g = green(c); 
      float b = blue(c); 
      
      float rl = red(last[location]); 
      float gl = green(last[location]); 
      float bl = blue(last[location]); 
      
      println("b = " + b);
      println("bl = " + bl);
      
      if(b < bl - variance  || b > bl + variance)
      {
         drift = 8;
         randomRadius = random(10,30);
         println("motion");
      } 
 
      else
     {
        randomRadius++;
        drift++; 
        println("no motion");
     }     
      
      
     
     
      
     drawCircles(c);

      
      newx+=xjump;
      
      last[location] = video.pixels[location];

    }
    newx = 0;
    newy+=yjump;
  }
  
  newy = 0;
  
  //let Processing know we're done playing with the pixel[] array
  video.updatePixels();  
}

void captureEvent(Capture v)
{
   v.read(); 
}


void drawCircles(color c)
{

  
  fill(c,opacity);
  noStroke();
  //ellipse(newx+random(rectdrift),newy+random(rectdrift),xjump-random(rectdrift),yjump-random(rectdrift));
  ellipse(newx+random(drift),newy+random(drift),randomRadius,randomRadius);
}

