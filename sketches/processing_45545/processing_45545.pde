
// noise grid variations (Listing 5.4, p.91-92 of Pearson 2011)
// noise grid with noise variance added to the movement


float xstart, xnoise, ystart, ynoise;  
float xstartNoise, ystartNoise;

void setup() {    
  size(300,300); 
  smooth(); 
  background(255); 
  frameRate(24);
  
  xstartNoise = random(20);  // use noise for start positions
  ystartNoise = random(20);
  xstart = random(10); 
  ystart = random(10);
}

void draw() {
  background(255);  // clears backgound every frame
  
  xstartNoise += 0.01;
  ystartNoise += 0.01;
  xstart +=(noise(xstartNoise) * 0.5) - 0.25;  // varies by +/- 0.25 every frame
  ystart +=(noise(ystartNoise) * 0.5) - 0.25;
  
  xnoise = xstart; 
  ynoise = ystart; 
  
  for (int y = 0; y <= height; y+=5) { 
    ynoise += 0.1;                                     
    xnoise = xstart; 
    for (int x = 0; x <= width; x+=5) { 
      xnoise += 0.1;     
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
} 

void drawPoint(float x, float y, float noiseFactor) {    
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(360));
  stroke(0, 150);
  line(0, 0, 20, 0);
  popMatrix();
}


