
float nOffset = 0;
float scale = 0.5;

void setup() {
  size(400, 300);
  strokeWeight(2);
  background(255);
  fill(0);
  frameRate(30);
}

void draw() {
  background(255);
  nOffset += 0.1;
  int nDetail = mouseY/(height/8);
  float nFalloff = (float) mouseX/width;
  noiseDetail(nDetail, nFalloff);
  text(("detail: "+nDetail), 10, height-15); 
  text(("falloff: "+nFalloff), 200, height-15); 

  float oldY = height - (noise(nOffset)*height)*scale;
  for (int i = 1; i < width; i++) {
    float noiseVal = height - (noise((float)i/100+nOffset)*height)*scale;
    line(i-1, oldY, i, noiseVal);
    oldY = noiseVal;
  }
}




