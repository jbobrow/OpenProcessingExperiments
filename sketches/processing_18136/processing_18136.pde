
float r = 120;
float g = 245;
float x1 = 1000;
float x2 = 1050;
float x3 = 2000;
float x4 = 2000;
float y1 = 1500;
float y3 = 1200;
float y4 = 1400;


void setup() {
  size(1440, 900);
  background(122, 237, 194);
  smooth();
  stroke(255);
  strokeWeight(35);
  }

void draw() {
  float w = ((random(20) * (random(2))));
  float z = random(4);
  strokeWeight(w);
  float x1 = ((pmouseX + (random(190))) * (z - 2));
  float x2 = (pmouseX + (random(300 * z)));
  float x3 = ((pmouseX + (random(10))));
  float x4 = ((pmouseY + (random(150))) * (pmouseX / 700));
  float y1 = ((pmouseY + ((random(20) * (random(2))))));
  float y3 = ((pmouseY + (random(400))) * 2);
  float y4 = (pmouseX + (random(1200)));
  noFill();
  curve(x1, x2, x3, x4, y1, pmouseY, y3, y4);
  }
  
void mouseMoved() {
  stroke(r, 100);
  float g = ((pmouseX / 10) + 111);
  float r = ((pmouseX / 5) + 120);
  background (r, g, 197);
}

void mouseDragged() {
  float g = random(245);
  stroke(g, 100);
}
  

