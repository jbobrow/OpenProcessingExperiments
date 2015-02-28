
PGraphics pg;

void setup() {
  size(950, 690);
  pg = createGraphics(720, 380, 350);
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  
  background(50, 50, 55);
  line(240);
}

void draw() {
  
  fill(10,-50, 20, 1);
  rect(0,0, width, height);
  fill(random(255),100,255,50);
  noStroke();
  ellipse(mouseX, mouseY, 35, 32);
  fill(6, 0);
  noStroke();
  line(mouseX, mouseY);
  
  pg.beginDraw();
  pg.background();
  pg.fill(295,90,180);
  pg.stroke(200,175,140,128);
  pg.ellipse(mouseX-120, mouseY-60, 15, 15, 15);
  pg.endDraw(0);
  
  // Draw the offscreen buffer to the screen with image() 
  image(pg, 120, 60);
  
}
