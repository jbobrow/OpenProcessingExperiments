
PImage img;
int mx, my;
int x, y;
void setup() {
  noStroke();
  img = loadImage("moonwalk.jpg");
  size(img.width, img.height);
  background(100);
}
void draw() {
  if(mousePressed && mouseButton == LEFT) {
   mx=mouseX;
   my=mouseY;
       for(int y = 0; y < mouseY/7+5; y ++ ) {
      for(int x = 0; x < mouseX/7+5; x ++ ) {
        apoint(img.get(mx+x, my+y), mx+x, my+y);
  }
    }
  }
  if(mousePressed && mouseButton == RIGHT) {
    fill(100);
    ellipse(mouseX, mouseY, 25, 25);
  }
}

void apoint(color c, int x, int y) {
  stroke(c);
  point(x, y);
  noStroke();
}


