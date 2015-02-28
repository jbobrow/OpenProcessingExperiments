
PGraphics pg;

void setup() {
  size(200, 200);
  pg = createGraphics(70, 180, P2D);
}

void draw() {
  fill(0, 12);
  rect(0, 0, width, height);
  fill(255);
  noStroke();
  fill(200);
  rect(mouseX, mouseY, 30, 30);
  fill(100);
  ellipse(mouseX+15, mouseY+15, 18, 18);
 fill(100);
  rect(mouseX+20, mouseY-10, 10, 10);
  
  pg.beginDraw();
  pg.background(120);
  pg.noFill();
  pg.stroke(255);
  pg.ellipse(mouseX-60, mouseY-60, 20, 60);
  pg.endDraw();
  
  image(pg, 60, 60); 
}

