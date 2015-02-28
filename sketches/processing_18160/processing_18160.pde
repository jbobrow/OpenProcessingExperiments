

void setup(){
  size(540,334);
  smooth();
  background(255);
  
  float noiseScale =  millis()/1000.;
  
  for(int y = 0; y < height ; y += 4)
  {
    for(int x = 0 ; x < width ; x += 4)
    {
      float noiseVal = noise(x*noiseScale,y*noiseScale);
      noiseVal *= 255;
      stroke(noiseVal);
      fill(noiseVal);
      ellipse(x,y,2,2);
    }
  } 
}

