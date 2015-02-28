
import processing.video.*;

Capture video;


int cols, rows;
int videoScale = 5;

PImage prevFrame;
float threshold = 200;

void setup(){
  size(640,480);

  smooth();
  cols = width/videoScale;
  rows = height/videoScale;
  video = new Capture(this,cols,rows,200);
  prevFrame = createImage(video.width,video.height,RGB);
  
}

void draw(){
  background(0);
  if(video.available()){
    prevFrame.copy(video,0,0,video.width,video.height,0,0,video.width,video.height);
    prevFrame.updatePixels();
    video.read();
  }
  
  loadPixels();
  video.loadPixels();
  prevFrame.loadPixels();

  float totalMotion = 0;
  for (int i = 0; i < cols; i++){
    for (int j = 0; j < rows; j++){
      int x = i*videoScale;
      int y = j*videoScale;
      
          color c = video.pixels[i+j*video.width];
      
            color current = video.pixels[i];
            color previous = prevFrame. pixels[i];
            float r1 = red(current); float g1 = green(current);
            float b1 = blue(current);
            float r2 = red(previous); float g2 = green(previous);
            float b2 = blue(previous);
    
            float diff = dist(r1,g1,b1,r2,g2,b2);
    
            totalMotion += diff;
    
            float avgMotion = totalMotion / video.pixels.length;
            

        smooth();
        stroke(c);
        fill(100+avgMotion*20,100,100);
        float r = avgMotion*2;
        ellipse(x,y,videoScale,videoScale);
  }
}
}

