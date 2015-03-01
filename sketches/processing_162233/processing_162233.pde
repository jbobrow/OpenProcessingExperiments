
import processing.video.*;
 
Capture video;
 
PImage prevFrame;
PImage img;


//setting up so it can track according to pixels  
float threshold = 300;
int Mx = 0;
int My = 0;
int ave = 0;
 
int larryX = width/2;
int larryY = height/2;
int rsp = 200;
 
void setup() {
  size(1024,720);
  video = new Capture(this, width, height, 30);
  img = loadImage("larrydavid.png");
 
  prevFrame = createImage(video.width,video.height,RGB);
}
 
void draw() {
  
 
  if (video.available()) {
    
    prevFrame.copy(video,0,0,video.width,video.height,0,0,video.width,video.height); 
    prevFrame.updatePixels();
    video.read();
  }
  
  loadPixels();
  video.loadPixels();
  prevFrame.loadPixels();
  
  Mx = 0;
  My = 0;
  ave = 0;
  
 
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      
      int loc = x + y*video.width;            
      color current = video.pixels[loc];      
      color previous = prevFrame.pixels[loc]; 
      
     
      float r1 = red(current); float g1 = green(current); float b1 = blue(current);
      float r2 = red(previous); float g2 = green(previous); float b2 = blue(previous);
      float diff = dist(r1,g1,b1,r2,g2,b2);
      
      
      if (diff > threshold) { 
        pixels[loc] = video.pixels[loc];
        Mx += x;
        My += y;
        ave++;
      } else {
        
        pixels[loc] = video.pixels[loc];
      }
    }
  }
  fill(255);
  rect(0,0, width, height);
  if(ave != 0){ 
    Mx = Mx/ave;
    My = My/ave;
  }
  if (Mx > larryX + rsp/2 && Mx > 50){
    larryX+= rsp;
  }else if (Mx < larryX - rsp/2 && Mx > 50){
    larryX-= rsp;
  }
  if (My > larryY + rsp/2 && My > 50){
    larryY+= rsp;
  }else if (My < larryY - rsp/2 && My > 50){
    larryY-= rsp;
  }


//larry placement
    updatePixels();
    image(img, larryX, larryY);

    
  
}

