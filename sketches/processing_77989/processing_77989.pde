
import processing.video.*;
Capture video;
int pixelCount;
int xB, xBR, retour;

void setup() {
  size(640, 480); 
  background(0);
  frameRate(24);
  pixelCount = width*height;
  video = new Capture(this, width, height, 24);
}
void draw() {
  if (video.available()) {
    xB = xB+2;
    if(xB>width) {
      retour = (retour+1)%2;
      println(retour);
      xB = retour;
    }
    xBR = width-xB;
    video.read();
    video.loadPixels();
    for (int y = 0; y < width; y++) {
       color colVid = video.get(xBR,y);
       int intensity = grayscale(colVid);
       color colPix = color(0,intensity,0);
       set(xB,y,colPix);
     }
  }
  fill(0,0,0,2);
  noStroke();
  rect(0,0,width,height);
  fill(50);
  //text(frameRate,0,20);
}

//convert RGB to grayscale
int grayscale(color _c) { 
  //extract RGB values
  int r = (_c >> 16) & 0xFF;
  int g = (_c >> 8) & 0xFF;
  int b = _c & 0xFF;

  //typical NTSC color to luminosity conversion
  int intensity = int(0.2989*r + 0.5870*g + 0.1140*b);
  if (intensity> 0) intensity=int(map(intensity,0,255,0,200));
  intensity = min(intensity,255);
  return intensity;
}


