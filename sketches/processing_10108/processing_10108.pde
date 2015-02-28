
import processing.video.*;
 
Capture cam;
 
void setup() {
  size(510, 382);
 
  cam = new Capture(this, 510, 382);
}
 
 
void draw() {
  if (cam.available() == true) {
    cam.read();
    image(cam, 0, 0);
    loadPixels();
    for(int x=0;x<(width*height);x+=1){
      color b=pixels[x]; 
      if(b<=color(mouseX/2)){
          color a=color(noise(x%width,0,x/width-x%width)*255,mouseY,125);
          pixels[x]=a;
        }else{
          color a=color(x%width,255,noise(x/width)*255);
          pixels[x]=a;
        }
    }
    updatePixels();
  }
}

