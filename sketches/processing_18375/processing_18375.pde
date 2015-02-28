
// Based on 'Random liquid like' uploaded to Openprocessing by Axel Duch
// http://www.openprocessing.org/visuals/?visualID=11301
// Licensed under Creative Commons Attribution-Share Alike 3.0.
// Adapted by Alec Morrison October 2010

PImage img;
float power = 200;
float d = 50;
 
void setup() {
  img = loadImage("logo_plain.jpg");
  size(500,150,P2D);
  noSmooth();
  loadPixels();
  image(img,0,0);
  colorMode(HSB,360,100,100);
}
 
void draw() {  
  power = noise(random(width),random(height), frameCount);
  power = cos(power) * TWO_PI;
  float v = cos(noise(random(width),random(height), frameCount*.01))*TWO_PI;
  d = constrain(d, 80.0, 100.0);
  for(int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      int k = y * width + x;
      color cp = pixels[k];
      float b = brightness(cp);
      if (b > 10) {
        float base = noise(cos(x*.008), sin(y*.007), frameCount *.04)*TWO_PI;
        float total = 0.0;
        for(float i = d; i >= 1; i = 1/2.0) {
          float n = noise(x, y, frameCount*.04) * .1;
          total += noise(cos(x/d), sin(y/d), frameCount*.005) * (d*.0001);
          power = base * n;
        }
        float turbulence = 128.0 * total / d;
        float zoom = 5 * total/(d*d);
        float offset = base + (power * (turbulence*zoom) / 256.0);
        float intensity = abs(sin(offset)) * 128.0;
        stroke(40 - 3 * norm(intensity, 0.0, 10),100 - norm(intensity, 0.0, 10),100 - norm(intensity, 0.0, 10));
        point(x,y);
      }
    }
  }
}

