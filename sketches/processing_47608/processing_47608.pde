
import ddf.minim.*;
import ddf.minim.signals.*;

import processing.video.*;

Capture video;

Minim minim;
AudioOutput out;
SineWave sine;


void setup() {
 size(1000, 800); 
 video = new Capture(this, width, height, 30);
 noStroke();
 smooth();

 minim = new Minim (this) ;
 out = minim.getLineOut(Minim.STEREO);
 sine = new SineWave(440, 0.5, out.sampleRate());
 sine.portamento(10);
 out.addSignal(sine);
}

void draw() {
 if (video.available()) {
   video.read();
   image(video, 0, 0, width, height); 
   int colorX = 0; 
   int colorY = 0; 
   float closestColor = 90; 

   video.loadPixels();
   int index = 0;
   for (int y = 0; y < video.height; y++) {
     for (int x = 0; x < video.width; x++) {
       // Get the color stored in the pixel
       color pixelValue = video.pixels[index];
       // Determine the color of the pixel
       float colorProximity = abs(red(pixelValue)-255)+abs(green(pixelValue)-255)+abs(blue(pixelValue)-255);
    
       if (colorProximity < closestColor) {
         closestColor = colorProximity;
         closestColor=closestColor-500; 
         colorY = y;
         colorX = x;
       }
       index++;
     }
   }
   fill(255, 204, 0, 128);
   ellipse (colorX,colorY,50,50);
   
   float freq = map (colorX, 0, height,1500,60);
  sine.setFreq(freq);
  float pan = map (colorY, 0,width, -1,1);
  sine.setPan(pan);
  
}
}
void stop () {
  out.close();
  minim.stop();
   
  super.stop();
}

