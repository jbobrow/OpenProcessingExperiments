


PGraphics pg;
//Brick 1 is 'forground', Brick2 is 'backgorund'
PImage brick1; 
PImage brick2;



void setup() {
  size(640,480);
  pg = createGraphics(640,480,P2D);
  brick1 = loadImage("brick_wall2.jpg");
  brick2 = loadImage("brick_wall1.jpg");
  background(brick2);
}

void draw() {
  pg.beginDraw();
  pg.background(0);
  pg.noStroke();
  pg.fill(255);
  pg.rect(mouseX,mouseY,120,30);
  pg.endDraw();

  brick1.mask(pg);
  image(brick1,0,0); 
  }
  



