
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


PImage img, img1, img2, img3;
int currentImg = 0;
int maxSobel = 5000;
boolean displayImage = false;
Minim minim;
AudioOutput out;
SineWave waveLeft;
SineWave waveRight;
boolean useScale = false;
float [] major = {523.25, 587.33, 659.26, 698.46, 783.99, 880.00, 987.77, 1046.50, 1174.66, 1318.51, 1396.91, 1567.98, 1760.00, 1975.53, 2093.00};


void setup() 
{
  img1 = loadImage("zachaxe.jpg");
  img2 = loadImage("grittynoise.jpg");
  img3 = loadImage("cloudnoise.jpg");
  img = img1;
  size(img.width, img.height);
  image(img, 0, 0);
  Sobel();
  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  waveLeft = new SineWave(200, 0.5, out.sampleRate());
  waveRight = new SineWave(200, 0.5, out.sampleRate());
  out.addSignal(waveLeft);
  out.addSignal(waveRight);
  if(!useScale)
    out.disableSignal(waveRight);
  else {
    waveLeft.setPan(-1);
    waveRight.setPan(1);
  }
}


void Sobel() 
{
  loadPixels();
  
  int [][] kernelx = {{3, 10, 3}, {0, 0, 0}, {-3, -10, -3}};
  int [][] kernely = {{3, 0, -3}, {10, 0, -10}, {3, 0, -3}};
  
  for(int y = 0; y < img.height; y++) {
    for(int x = 0; x < img.width; x++) {
      float Gx = 0;
      float Gy = 0;
      for(int j = 0; j < 3; j++) {
        for(int i = 0; i < 3; i++) {
          int index = (y-j-1)*img.width + x - i - 1;
          if(index >= 0 && index < img.width*img.height) {
            float gray = 0.3*red(img.pixels[index]) + 0.59*green(img.pixels[index]) + 0.11*blue(img.pixels[index]);
            Gx += kernelx[i][j] * gray;
            Gy += kernely[i][j] * gray;
          }
        }
      }
      float val = sqrt(Gx*Gx + Gy*Gy);
      int v = int(map(val, 0, maxSobel, 0, 255));
      int index = y*img.width + x;
      pixels[index] = color(v,v,v);
    }
  }
  updatePixels();
}


float SobelAtIndex(int x, int y)
{
  int [][] kernelx = {{3, 10, 3}, {0, 0, 0}, {-3, -10, -3}};
  int [][] kernely = {{3, 0, -3}, {10, 0, -10}, {3, 0, -3}};
  
  float Gx = 0;
  float Gy = 0;
  for(int j = 0; j < 3; j++) {
    for(int i = 0; i < 3; i++) {
      int ind = (y-j-1)*img.width + x - i - 1;
      if(ind >= 0 && ind < img.width*img.height) {
        float gray = 0.3*red(img.pixels[ind]) + 0.59*green(img.pixels[ind]) + 0.11*blue(img.pixels[ind]);
        Gx += kernelx[i][j] * gray;
        Gy += kernely[i][j] * gray;
      }
    }
  }
  return sqrt(Gx*Gx + Gy*Gy);
}


void UpdateOscillator()
{
  float val = SobelAtIndex(mouseX, mouseY);
  float freq;
  int index = 0;
  if(useScale) {
    index = int(map(val, 0, maxSobel, 0, 14));
    if(index > 14)
      index = 14;
    if(index < 0)
      index = 0;
    waveLeft.setFreq(major[index]);
    if(index < 12)
      waveRight.setFreq(major[index+3]);
    else waveRight.setFreq(major[index-3]);
  }
  else {
    freq = map(val, 0, maxSobel, 200, 10000);
    waveLeft.setFreq(freq);
  }
}


void draw() {}


void mouseMoved()
{
  UpdateOscillator();
}


void keyPressed()
{
  if(key == '1' && currentImg != 1) {
    img = img1;
    currentImg = 1;
    maxSobel = 3500;
    UpdateOscillator();
  }
  else if(key == '2' && currentImg != 2) {
    img = img2;
    currentImg = 2;
    maxSobel = 5000;
    UpdateOscillator();
  }
  else if(key == '3' && currentImg != 3) {
    img = img3;
    currentImg = 3;
    maxSobel = 500;
    UpdateOscillator();
  }
  else if(key == 'f' || key == 'F')
    displayImage = !displayImage;
  else if(key == 's' || key == 'S') {
    useScale = !useScale;
    UpdateOscillator();
  }
    
  if(displayImage)
    image(img, 0, 0);
  else
    Sobel();
  
  if(!useScale) {
    out.disableSignal(waveRight);
    waveLeft.setPan(0);
  }
  else {
    out.enableSignal(waveRight);
    waveLeft.setPan(-1);
    waveRight.setPan(1);
  }
}


void stop()
{
  out.close();
  minim.stop();
  super.stop();
}

