
Spot spot;
ArrayList spots;

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  colorMode(HSB);
  frameRate(60);
  //spot = new Spot(width/2, height/2);
  //spot.init();
  spots = new ArrayList();
  for (int i = 0; i < 300; i++) {
    spots.add(new Spot(random(width), random(height)));
    Spot spot = (Spot) spots.get(spots.size()-1);
    spot.init();
  }
  
  
}

void draw() {
  background(0);
  //spot.move();
  //spot.display();
  for (int i = 0; i < 300; i++) {
    Spot spot = (Spot) spots.get(i);
    spot.move();
    spot.display();
  }
}

class Spot{
  float x, y;
  float x0, y0, c0;
  float amplitudeX, amplitudeY;
  
  Spot(float _x, float _y) {
    x = _x;
    y = _y;
  }
  
  void init() {
    x0 = x;
    y0 = y;
    c0 = random(255);
  }
    
  void move() {
    x = x0 + amplitudeX*sin(frameCount*PI/60);
    y = y0 + amplitudeY*sin(frameCount*PI/60);
    if (frameCount%60 == 0) {
      amplitudeX = random(-100, 100);
      amplitudeY = random(-100, 100);
      }
  }
  
  void display() {
    fill(c0, 204, 204);
    ellipse(x, y, 6, 6);
  }
  
}
