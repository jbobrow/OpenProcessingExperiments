
// a cloud in a box (Listing 5.6, p.97-97 of Pearson 2011)
// constructing a cube of three-dimensional noise

float xstart, ystart, zstart;
float xnoise, ynoise, znoise;

int sideLength = 200;
int spacing = 5;

void setup() {    
  size(500, 300, P3D); 
  background(0);
  noStroke();

  xstart = random(10);
  ystart = random(10);
  zstart = random(10);
}

void draw() {
  background(0);

  xstart += 0.01;
  ystart += 0.01;
  zstart += 0.01;

  xnoise = xstart;
  ynoise = ystart;
  znoise = zstart;

  translate(150, 20, -150);  // reposition to get a better perspective
  rotateZ(frameCount * 0.1);
  rotateY(frameCount * 0.1);

  for(int z = 0; z <= sideLength; z+=spacing) {
    znoise += 0.1;
    ynoise = ystart;
    for (int y = 0; y <= height; y+=5) { 
      ynoise += 0.1;                                     
      xnoise = xstart; 
      for (int x = 0; x <= width; x+=5) { 
        xnoise += 0.1;     
        drawPoint(x, y, z, noise(xnoise, ynoise, znoise));
      }
    }
  }
} 

void drawPoint(float x, float y, float z, float noiseFactor) {    
  pushMatrix();
  translate(x, y, z);
  float grey = noiseFactor * 255;
  fill(grey, 10);
  box(spacing, spacing, spacing);
  popMatrix();
}


