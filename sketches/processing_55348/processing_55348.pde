
import processing.video.*;
  
Capture video;
  
void setup() {
  size(600, 400);
  
  
  
  video = new Capture(this, 600, 400);
}

  
void draw() {
  if (video.available() == true) {
    video.read();
    image(video, 0, 0);
    loadPixels();
    for(int x=0;x<(width*height);x+=1){
      color b=pixels[x];
      if(b<=color(mouseX/2)){
          color a=color(noise(width,0,x/width-width)*255,mouseY,125);
          pixels[x]=a;
        }else{
          color a=color(width,175,noise(x/width)*8);
          pixels[x]=a;
        }
    }
    updatePixels();
  }
}

void mousePressed(){
  if (video.available() == true) {
    video.read();
    image(video, 0, 0);
    loadPixels();
    for(int x=0;x<(width*height);x+=1){
      color b=pixels[x];
      if(b<=color(mouseX/2)){
          color a=color(noise(width,0,x/width-width)*10,mouseY,10);
          pixels[x]=a;
        }else{
          color a=color(width,10,noise(x/width)*8);
          pixels[x]=a;
         
        }
    }
    updatePixels();
  }
}

