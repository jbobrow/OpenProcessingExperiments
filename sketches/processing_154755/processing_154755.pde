
float x;
float y; 
float sze;

void setup() {
    size(400,400);
    x = 0.0;
    background(255);
}

void draw(){
  
  for (int j = 0; j < width;  j++) {
  
    float yRandom    = random(0, height);
    float sizeRandom = random(1, 20);
   // float yGaussian = randomGaussian() * height; 
   //randomGaussian doesn't exist in the JS version. boo.
    
    float yNoise     = noise(j) * height;
    float sizeNoise  = noise(j) * y;
    
  
    y = yRandom;
    sze = sizeRandom;
    stroke(255, 127, 127);
    //line(0,0,j, yRandom);
    ellipse(x, y, sze, sze);
    
  /*  stroke(127, 127, 255);
    line(0,0,j, yGaussian); */
    
    y = yNoise; 
    sze = sizeNoise;
    stroke(134, 200, 134);
    //line(0,0,j, yNoise);
    ellipse(x, y, sze, sze); 
  }
  x = x +(y*.4);
}
