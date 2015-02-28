
float noiseScale=0.02;

void setup() {
  size(640, 360); 
  frameRate(20);
}

void draw() {
  float y = 0;
   background(255);
   while(y < height) {
    float noiseVal = noise(mouseX*noiseScale);
    float strokeNoise = noise(y * noiseScale);
    strokeWeight(strokeNoise*8);

    y += (noiseVal * 20);
    line(0, y, width, y); 
  }

  float x = 0;
  while(x < width) {
    float noiseVal = noise(mouseY*noiseScale);
    float strokeNoise = noise(x * noiseScale);
    strokeWeight(strokeNoise*8);

    x += (noiseVal * 20);
    line(x, 0, x, height); 
  }
}
