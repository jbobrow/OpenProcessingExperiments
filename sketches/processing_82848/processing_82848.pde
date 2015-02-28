
import processing.video.*;

color black = color(0);
color white = color(255);
int numPixels;
Capture video;

void setup(){
size(640,480);
strokeWeight(5);
video = new Capture(this, width, height,24);
numPixels = video.width*video.height;
noCursor();
smooth();
}

void draw(){
if(video.available()){
video.read();
video.loadPixels();
int threshold = 20;
float pixelBrightness;

loadPixels();

for(int i = 0; i< numPixels; i++){
pixelBrightness = brightness(video.pixels[i]);
if(pixelBrightness > threshold){
pixels[i] = white;
      }else{
      pixels[i] = black;
      }
    }
    updatePixels();
    
    int testValue = get(mouseX,mouseY);
    float testBrightness = brightness(testValue);
    if(testBrightness > threshold){
    fill(black);
    }else{
      
    fill(white);
    }
    ellipse(mouseX,mouseY,20,20);
  }
}
