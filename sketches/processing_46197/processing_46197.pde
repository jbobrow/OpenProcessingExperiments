
//Author:Dulce Andino
//Purpose:Class Exercise
// noise grid variations (Listing 5.4, p.91-92 of Pearson 2011)
// noise grid with noise variance added to the movement
 
 
float xstart, xnoise, ystart, ynoise; 
float xstartNoise, ystartNoise;
 
void setup() {   
  size(400,400);
  smooth();
  background(0);
  frameRate(24);
   
  xstartNoise = random(10);  // use noise for start positions
  ystartNoise = random(10);
  xstart = random(10);
  ystart = random(10);
}
 
void draw() {
 background(0);  // clears backgound every frame
   
  xstartNoise += 0.01;
  ystartNoise += 0.01;
  xstart +=(noise(xstartNoise) * 0.1) - 0.1;  // varies by +/- 0.25 every frame
  ystart +=(noise(ystartNoise) * 0.1) - 0.1;
   
  xnoise = xstart;
  ynoise = ystart;
   
  for (int y = 0; y <= height; y+=3) {
    ynoise += 0.1;                                    
    xnoise = xstart;
    for (int x = 0; x <= width; x+=3) {
      xnoise += 0.1;    
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}
 
void drawPoint(float x, float y, float noiseFactor) {   
  
  int r=255;
    int g=255;
    int b=255;
 
    r=floor(random(193));
    g=floor(random(235));
    b=floor(random(60));

  
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(360));
  stroke(r,g,b);
  strokeWeight(0.5);
  line(0, 0, 40, 0);
  popMatrix();
}


