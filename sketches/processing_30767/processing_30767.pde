
import processing.video.*;

Capture video;

void setup() {
  size(640, 480); 
  video = new Capture(this, width, height, 30);
  noStroke();
  smooth();
 
}

void draw() {
  
  
  if (video.available()) {
    video.read();
    image(video, 0, 0, width, height); 
    int brightestX = 0;
    int brightestY = 0; 
    float brightestValue = 0; 
    video.loadPixels();
    int index = 0;
    for (int y = 0; y < video.height; y++) {
      for (int x = 0; x < video.width; x++) {
    
        int pixelValue = video.pixels[index];
       
        float pixelBrightness = brightness(pixelValue);
        
        
        if (pixelBrightness > brightestValue) {
          brightestValue = pixelBrightness;
          brightestY = y;
          brightestX = x;
        }
        index++;
      }
    }
    
    //background (0);
    //dibujos

   float color1 = random(0,255);
  float color2 = random(0,255);
  float color3 = random(0,255);
  if(mousePressed){
    background(color1, color2, color3);
  }
  else{
  fill(color1, color2, color3);
  ellipse(mouseX, mouseY, mouseX-150, mouseX-150);
  ellipse(brightestX, brightestY, 50, 50);
  stroke(255);
    line (brightestX, brightestY, 320, 80);
    line (brightestX, brightestY, 80, 320);
     line (brightestX, brightestY, 500, 320);
  
   
  

  }
}
}

