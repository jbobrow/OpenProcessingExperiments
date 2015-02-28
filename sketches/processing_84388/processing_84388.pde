
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
    strokeWeight(strokeNoise*10);

    y += (noiseVal * 20);
    line(0, y, width, y); 
  }
}
