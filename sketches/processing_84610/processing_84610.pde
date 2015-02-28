
float noiseScale=0.02;
float wiggle = 0.0001;

void setup() {
  size(640, 640); 
  noFill();
  smooth();
}

void draw() {
  float h = height - 10;
  background(255);

  float gap = noise(mouseY*noiseScale) * 20;
  noiseScale += random(wiggle * -1, wiggle);

  while(h > 0) {
    float noiseVal = noise(mouseX*noiseScale);
    float strokeNoise = noise(h * noiseScale);

    h -= gap;
    ellipse(width/2, height/2, h, h);
  } 
}
