
float noiseScale=0.02;

void setup() {
  size(640, 360); 
  background(255);
//  frameRate(30);
//  loop();
}

float oldX = -1;
float oldY = -1;

void draw() {
  float x = 0;
  float y = 0;

  fill(255,50);
  rectMode(CORNER);
  rect(0,0,width,height);

    y = 0;

     while(y < height/2) {
      float noiseVal = noise(mouseX*noiseScale);
      float strokeNoise = noise(y * noiseScale);
      strokeWeight(strokeNoise*6);
  
      y += (noiseVal * 20);

      line(0, y, width, y); 
      line(0, height - y, width, height - y); 
    }

    x = 0;
    while(x < width/2) {
      float noiseVal = noise(mouseY*noiseScale);
      float strokeNoise = noise(x * noiseScale);
      strokeWeight(strokeNoise*6);
  
      x += (noiseVal * 20);
      line(x, 0, x, height); 
      line(width - x, 0, width - x, height); 
    }
  
}
