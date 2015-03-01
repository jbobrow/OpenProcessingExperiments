
PVector center;
float size = 1;
float step = 2;
float xyOff = 0.0;
void setup () {
  size (500, 500);
  background(255);
  center = new PVector(width/2, height/2);
  smooth();
  colorMode(HSB, 360, 100, 100);
}
void draw () {

  if (size % 4 > 2) 
  {
    xyOff = xyOff + 0.001;
  } else
  {
    xyOff = xyOff + 0.01;
  }

  float noiseC = noise(xyOff) * 100;

  noFill();

  float colX = map(size, 0, width, 0, 30);
  stroke(360-colX, 40+colX, 40+colX);
  ellipse(center.x +noiseC, center.y+noiseC, size, size);
  size = size + step;
  if (size > width+200)
  {
    size = 0;
    background(360);
  }
}



