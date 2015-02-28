
/* @pjs preload="orange.jpg,blau.jpg,magenta.jpg,schwarz.jpg,rechts.png,links.png,unten.png"; */
PGraphics pg;
PImage img;
PImage[] stars;
PImage[] masks;
float[] angle;
float[] speed;

void setup() {
  frameRate(10);
  
  size(500, 500);
  imageMode(CENTER);
  
  pg = createGraphics(700,700);
  pg.imageMode(CENTER);
  
  stars = new PImage[4];
  stars[0] = loadImage("orange.jpg");
  stars[1] = loadImage("blau.jpg");
  stars[2] = loadImage("magenta.jpg");
  stars[3] = loadImage("schwarz.jpg");
  masks = new PImage[3];
  masks[0] = loadImage("rechts.png");
  masks[1] = loadImage("links.png");
  masks[2] = loadImage("unten.png");
  speed = new float[4];
  speed[0] = 0.01;
  speed[1] = 0.02;
  speed[2] = 0.015;
  speed[3] = -0.005;
  angle = new float[4];
  angle[0] = 0;
  angle[1] = 0;
  angle[2] = 0;
  angle[3] = 0;
}

void draw() {
  pushMatrix();
  translate(250, 250);
  rotate(angle[3]);
  translate(-250, -250);
  image(stars[3], 250, 250);
  popMatrix();

  for (int i = 0; i<3; ++i) {
    pg.pushMatrix();
    pg.beginDraw();
    pg.translate(350, 350);
    pg.rotate(angle[i]);
    pg.translate(-350, -350);
    pg.image(stars[i], 350, 350);
    pg.endDraw();
    pg.popMatrix();
  
    img = pg.get(0,0,500,500);
    img.mask(masks[i]);
  
    image(img, 250, 250);
    // It works if I replace "img" with "pg".
    // Otherwise I get an "OutOfMemoryError".
  }
  for (int i=0; i<4; ++i) {
    angle[i] += speed[i];
    //if (angle[i] > PI/2) angle[i] -= PI/2;
  }
}


