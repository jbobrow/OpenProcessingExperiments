
// Perlin Noise Demo - Jim Bumgardner
PImage overlay;
float kNoiseDetail = 0.01;
float r;
float speed= .05;
float ox = 50;
float oy = 20;
Speck[] specks;

void setup(){
  overlay = loadImage("CPZTUBEFRAME.png");
  size(512,127);
  smooth();
  r = width/2;

  noiseDetail(6,.4);
  colorMode(HSB, 1);
  noStroke();
  
  specks = new Speck[50];
  for(int i = 0; i < specks.length; i++){
    PVector velocity = new PVector(-3.5, 0);
    PVector location = new PVector(random(width), random(height));
    specks[i] = new Speck(random(2,4), random(1), location, velocity);
  }
  
}


void draw(){
  ox += speed;

  for (int y = 0; y < height; ++y)
  {
    for (int x = 0; x < width; ++x)
    {
      float v = noise(ox+x*kNoiseDetail,oy+y*kNoiseDetail,millis()*.0008);
      set(x,y,color(v/2+.4,1,v*v+.4));     
    }
  }
  for(int i = 0; i < specks.length; i ++){
    specks[i].handle();
  }
  image(overlay,0,0);
}



