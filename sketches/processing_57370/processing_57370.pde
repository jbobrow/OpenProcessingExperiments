
import processing.video.*;

Capture video;


int cols, rows;
int videoScale = 5;

PImage prevFrame;


String chars = "smile ^.^ hello";
PFont f;

int fontsize = 15;
int fontmax = 100;
int fontmin = 0;

void setup(){
  size(640,480);

  smooth();
  cols = width/videoScale;
  rows = height/videoScale;
  video = new Capture(this,cols,rows,200);
  prevFrame = createImage(video.width,video.height,RGB);
  
    f = createFont("Ariel",15,true);
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

   int charcount = 0;

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
        stroke(100+avgMotion*40,100*10,100*100);
        fill(100+avgMotion*40,100*10,100*100);
        float r = avgMotion*2;
        rect(x,y,videoScale,videoScale);

        
         textFont(f,fontsize);
         fill(c);
         text(chars.charAt(charcount),x,y);
         charcount = (charcount + 1) % chars.length();
  }
}
}
void keyPressed(){
  switch(keyCode){
     case UP:
     if(videoScale < cols){
        videoScale++;
        break;
      }
      case DOWN:
      if( videoScale < cols){
        videoScale--;
        break;
      }
  }
}


