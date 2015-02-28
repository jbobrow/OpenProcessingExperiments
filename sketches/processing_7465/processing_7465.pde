
int velocity = 10;

void setup() {

size(400, 400);
smooth();
noStroke();

}

void draw() {
  background(0);
  for(int y = 0; y < height; y+=10) {
    for (int x = 0; x < y; x+=10) {
      fill(x+y/4.8, y%90, x-y/4.3, 100);
      ellipse(x+mouseY/5.3, y+mouseX/9.3, x, y);
      //ellipse(x+y/5.3, y+x/9.3, x, y);
      x = x + velocity;
      x = x % width;
      y = y + velocity;
      y = y % height;
    }
  }
}
    



