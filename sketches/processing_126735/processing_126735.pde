

PGraphics pg;

void setup() {
  size(960, 600);
  pg = createGraphics(720, 460);
  background(230, 115, 255);
  line(240);
}

void draw() {
  fill(0, -50, 20, 1);
  rect(0, 0, width, height);
  fill(135, 140, 130);
  noStroke();
  ellipse(mouseX, mouseY, 10, 10);
  fill(6, 255);
  noStroke();
  line(mouseX, mouseY);
  
  pg.beginDraw();
  pg.background(12, 60, 100, 50);
  pg.fill(235);
  pg.stroke(255, 175, 140, 128);
  pg.ellipse(mouseX-120, mouseY-60, 20, 25, 38);
  pg.endDraw(0);
  
  // Draw the offscreen buffer to the screen with image() 
  image(pg, 120, 60);
  
}
