
int x = 50;
int y = 50;
int w = 100;
int h = 75;
float r = 100;
float g = 30;
float b = 100;
void setup() {
  size(200, 200);
}

void draw() {
  background(255);
  noStroke();


  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
    float r = random(255);
    float g = random(255);
    float b = random(255);
    fill (r, g, b);
  }
  else {
    fill (255);
  }
  rect(x, y, w, h);
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h);
  }

  void mousePressed() {
    saveFrame("thumbnail.png");
  }


