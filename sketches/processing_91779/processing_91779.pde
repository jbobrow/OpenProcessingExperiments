
import processing.video.*;

Capture video;
int tamReticula = 10;



void setup()
{
  size(800, 600);
  video = new Capture(this, 800, 600, 15);
}

void draw()
{
  background(0);
  if (video.available())
  {

    video.read();
  }

  video.loadPixels();

  for (int j = 0; j < video.width; j= j+tamReticula) 
  {
    for (int i = 0; i < video.height; i= i+tamReticula) 
    {
      int loc = j + i * video.width;
      
      float r = red(video.pixels[loc]);
      float g = green(video.pixels[loc]);
      float b = blue(video.pixels[loc]);
      
      noStroke();
      fill(r,g,b);
      ellipse(j,i, 8,8);
    }
  }

  
  //image(video, 0,0, width, height);
}


