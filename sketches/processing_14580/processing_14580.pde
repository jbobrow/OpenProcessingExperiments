
import processing.video.*;

Capture vid;

int videoScale=8;
int cols, rows;



void setup()
{
  size(640, 480);
  cols= width/videoScale;
  rows = height/videoScale;  
  vid = new Capture(this, width, height, 30);
  noStroke();
}

void captureEvent(Capture vid) {
  vid.read();
}

void draw()
{
  
   background(255, 255, 255);
//   image(vid,0,0, width, height);
    
  if (vid.available()) {
    vid.read();
  }
  vid.loadPixels();

  for (int i=0; i<cols; i++)
  {
    for (int j=0; j<rows; j++)
    {
      int x = i*videoScale;
      int y = j*videoScale;
      int loc = (vid.width -x -1)+y*width;   
  
      color c= vid.pixels[loc];
      fill(c);
      fill(0,0,0);
      fill(255,255,255);
      stroke(1);
      
      
      
      float bright= brightness(c);
      
      if (bright>20)
              fill(bright);
//        fill(map(bright, 10, 255, 255, 0));
      
      float esize= map(bright, 0, 255, videoScale, 0);

      
      if (esize>2)
      ellipse(x,y, esize, esize);
      



    }
    // end j loop

  }
  //end i loop


//  image(vid,0,0, 640, 480);

}


