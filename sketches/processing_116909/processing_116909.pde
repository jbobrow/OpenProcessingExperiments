
PGraphics pg;

void setup() {
  size(640, 360);
  pg = createGraphics(100, 100);
}

void draw() {
  fill(0, 0.01);
  rect(0, 0, width, height);
  fill(255, 127.5, 0);
  noStroke();
  ellipse(mouseX, mouseY, 10, 10);
  
  pg.beginDraw();
  pg.background(51);
  pg.noFill();
  pg.stroke(0.1);
  pg.ellipse(mouseX-120, mouseY-60, 60, 60);
  pg.endDraw();
  
  // Draw the offscreen buffer to the screen with image() 
  image(pg, 120, 60); 
}
