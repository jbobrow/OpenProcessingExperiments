
PImage img;
Random rand = new Random();
float stdDev = 50;

void setup() {
  img = loadImage("climbing_anchors.jpg");
  size(700, 467);
  noStroke();
  
  image(img, 0, 0);
  textFont(createFont("sans serif", 20));
  textAlign(CENTER);
}

void draw() {
  for (int i = 0; i < 30; i++) {
    int x = (int)random(width);
    int y = (int)random(height);
    fill(get(x, y), 10);
    ellipse(vary(x), vary(y), 70, 40);
  }
  fill(255, 10);
  text("click the mouse to start over", width/2, height-30);
}

int vary(float x) {
  return (int)(x + (rand.nextGaussian() * stdDev));
}

void mouseClicked() {
  image(img, 0, 0);
}

