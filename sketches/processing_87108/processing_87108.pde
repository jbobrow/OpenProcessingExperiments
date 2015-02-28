
float xoff = 0.0;
float yoff = 0.0;
float xstart, xnoise, ystart, ynoise;


void setup() {

  size (400, 400);
  noStroke();
  noiseSeed(1);
  xstart = random(10); 
  ystart = random(10);
}

void draw() {

  background(120, 200, 150);
  
  xoff = xoff + .01;
  xstart += 0.15; 
  ystart += 0.15;
  xnoise = xstart; 
  ynoise = ystart;
  float n = noise(xoff) * width;
  rect(n, 0, n, height);
  color c = color(220, 140, 120, 100);
  float value = alpha(c); 
  fill(value);
  float noiseScale=4.0;
  float k = noise(xoff) * height;
  rect(30, k, n, width);
  fill(210, 40, 120);


for (int y=0;y<=height;y+=10) { 
    ynoise += 0.1; 
    xnoise = xstart; 
    for (int x=0;x<=width;x+=10) {
      xnoise += 0.1; 
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}
void drawPoint(float x, float y, float noiseFactor) { 
  pushMatrix(); 
  translate(x, y); 
  rotate(noiseFactor * radians(5));
  noStroke(); 
  float edgeSize = noiseFactor * 10; 
  //float grey = 100 + (noiseFactor * 20); 
  float c = color (200,100,250); 
  float alph = 50 + (noiseFactor * 20); 
  fill(c, alph); 
  rect(0, 0, edgeSize, edgeSize); 
  popMatrix();
}


