
PImage bg;
PImage blossom;
PImage bug;
float startX = 600; // Initial x-coordinate
int stopX = -10; // Final x-coordinate
int startY = -30; // Initial y-coordinate
int stopY = 1050; // Final y-coordinate
float x = 600; // Current x-coordinate
float y = -30; // Current y-coordinate
float step = 0.003; // Size of each step (0.0 to 1.0)
float pct = 0.0; // Percentage traveled (0.0 to 1.0)
float speed = 2.5;
int diameter = 20;
float xbug;
float ybug;
float easing = 0.3;

void setup() {
  size(800, 800);
  bg = loadImage("summer.jpg");
  blossom = loadImage("sakura.png");
  bug = loadImage("fly.png");
  xbug = width/2;
  ybug = height/2;
}
void draw() {
  image(bg, 0, 0);
  ablossom();
  abug();
}

void ablossom() {
  if (pct < 1.0) {
    x = startX + ((stopX-startX) * pct);
    y = startY + ((stopY-startX) * pct);
    pct += step;
    image(blossom, x, y, 50, 40);
  }
}
void abug() {
  xbug += random(-speed, speed);
  ybug += random(-speed, speed);
  image(bug, (mouseX*2)-xbug, (mouseY*2)-ybug, diameter, diameter);
}



