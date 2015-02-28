
// Firkalizator
// Levente Sandor, 2014


ArrayList<PVector> points = new ArrayList<PVector>();
int noiseValue; 
float noiseScale;
float noiseScaleInc;
float hue_;
float hue_Inc;
float sat;
float bri;
float briInc;
float zoom;
float zParam;


void setup() {
  size(900, 400);
  colorMode(HSB, 1.0);
  background(random(1.0), random(0.5), random(1.0));
  
  noiseValue = int(random(2, 4));
  noiseScale = random(0.3, 0.9);
  noiseScaleInc = random(0.0001, 0.001);

  hue_ = random(0.01, 0.99);
  hue_Inc = random(0.00000005, 0.000001);

  sat = random(0.5);

  bri = random(0.01, 0.99);
  briInc = random(0.000001, 0.00001);

  zoom = random(0.0001, 0.01); 
  zParam = random(0.00001, 0.001);
  
  points.clear();
  for (int i = 0; i < 1000; i++) {
    points.add(new PVector(random(width), random(height)));
  }
} 


void draw() {
  noiseDetail(noiseValue, noiseScale);
  noiseScale += noiseScaleInc;
  if (noiseScale < 0.3 || noiseScale > 0.9) {
    noiseScaleInc = -noiseScaleInc;
  }
  
  for (PVector point : points) {
    stroke(hue_, sat, bri, 0.05);

    hue_ += hue_Inc;
    if (hue_ < 0.01 || hue_ > 0.99) {
      hue_Inc = -hue_Inc;
    }

    bri += briInc;
    if (bri < 0.01 || bri > 0.99) {
      briInc = -briInc;
    }

    float x = point.x;
    float y = point.y;
    line(x, y, x + 1, y + 1);  

    float a = 10 * noise(x * zoom, y * zoom, frameCount * zParam); 
    x += cos(a);
    y += sin(a);
    if (x < 0 || x >= width || y < 0 || y >= height) {
      x = random(width);
      y = random(height);
    }
    point.x = x;
    point.y = y;
  }
}


void keyPressed() {
  saveFrame("render/firka-######.png");
}


void mouseClicked() {
  setup();
}

