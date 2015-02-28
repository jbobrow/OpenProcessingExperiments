
float noiseScale = 0.05f;
float rand = random(500);
float count = 5;


float cnt = (float)random(500);
float step = 0.1;

void setup() {
  size(700, 400);
  smooth();
  background(0);
  stroke(255);
  colorMode(HSB);
  noiseDetail(1);
}

void draw() {
  background(16);
  
//  noiseDetail(2, width/((float)mouseX + 1) / 2);
  
  cnt += step;
  
  for(int i = 0; i < width/2; i++) {
    for(int j = 0; j < 10; j++) {
      float noiseVal = noise((cnt + i) * noiseScale,
                             (cnt - j) * noiseScale);
      stroke(j + noiseVal * 255, 200, 255);
      point(i * 2, j*3 + noiseVal * 150 + height/3);
    }
    
  }
}

