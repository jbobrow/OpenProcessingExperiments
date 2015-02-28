
float[] x, y, sz; 
int [] cursz;

void setup() 
{
  size(400, 400);
  smooth();
  background(0);
  colorMode(HSB, 360, 100, 100);
  noFill();
  strokeWeight(1);
  frameRate(45);

  int n = 7; 
  x = new float[n]; 
  y = new float[n]; 
  sz = new float[n]; 
  cursz = new int[n]; 

  for (int i = 0; i < x.length; i++) { 
    initShape(i);
  }
}

void draw() 
{
  for (int i = 0; i < x.length; i++) { 
    drawRing(frameCount, x[i], y[i], cursz[i]); 
    cursz[i]++;
    if (cursz[i] > sz[i]) {
      initShape(i);
    }
  }
  noStroke();
  fill(0, 0, 0, 5);
  rect(0, 0, width, height);
}

void initShape(int i) 
{
  x[i]  = random(width); 
  y[i] = random(height); 
  sz[i] = 10  + random((width - 30)/ 3);  
  cursz[i] = (int) sz[i] / 2;
}

void drawRing(int count, float x, float y, int sz) 
{
  int hue = (count % 360 + (int) (x + y) ) % 360;
  stroke(hue, 85, 95); 
  ellipse(x, y, sz, sz);
}


