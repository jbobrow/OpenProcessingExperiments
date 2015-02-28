

PGraphics pg;

void setup() {
  size(320, 200);
  pg = createGraphics(width, height, P2D);
  smooth();
  frameRate(60);
  colorMode(RGB, 255, 255, 255);
  pg.colorMode(RGB, 255, 255, 255);
}

void draw() {
  background(0);

  pg.beginDraw();
  pg.tint(255, 255, 255, 200); // Make the next version of the image a little 'lighter'
  pg.image(pg, 0.5, 0.5); // Put the PGraphics on top of itself (Not sure why I need 0.5 here)
  pg.endDraw();

  image(pg, 0, 0); // Paste the PGraphics object as an image
  println(frameRate);
}

// On clicking, make an ellipse which will fade away into oblivion soon.
// The playing with colorMode is only to get aesthetically pleasing colors.
void mousePressed() {
  pg.beginDraw();
  pg.colorMode(HSB, 360, 100, 100);
  float hue = random(360);
  pg.fill(hue, 100, 100);
  pg.stroke(hue, 100, 100);
  pg.ellipse(mouseX, mouseY, 10, 10);
  pg.colorMode(RGB, 255, 255, 255);
  pg.endDraw();
}



