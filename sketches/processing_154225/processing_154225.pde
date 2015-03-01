
/*
 * Creative Coding
 * Week 4, Foldout 02: Random, Noise and Gaussian
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This program illustrates the use of different methods for generating randomness in Processing
 * See the foldout associated with this sketch for more details
 * 
 */   


void setup() {
  size(400, 700);
  frameRate(3);
}

void draw() {
  background(#6621D8);

  int num = width;
  float noiseOff = 0;
  
  // noise
  for (int i=0; i< num; i+=5) {
    float y = 150*noise(noiseOff);
    line(i, 150, i, y);
    fill(#D821D6);
    ellipse(i,y, 6, 3);
    noiseOff += 0.05;
  }

  // random
  for (int i=0; i< num; i+=5) {
    float y = random(100);
    line(i,350, i, 350-y);
    ellipse(i, 150-y,8,8);
  }

  // randomGaussian
  for (int i=0; i< num; i+=5) {
    float y = 50*randomGaussian();
    line(i, 640,i, y+440);
    ellipse(i, y+440, 4,3);
  }
  

}



