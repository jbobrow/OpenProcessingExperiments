
// initialize each image file
PImage Sun;
PImage Mercury;
PImage Venus;
PImage Earth;
PImage Mars;
PImage Comet;
PGraphics sf;  // starfield

float cometX, cometY;
float cometXrad, cometYrad;

void setup() {
  size(400, 400);
  Sun = loadImage("data/Sun.png");
  Mercury = loadImage("data/Mercury.png");
  Venus = loadImage("data/Venus.png");
  Earth = loadImage("data/Earth.png");
  Mars = loadImage("data/Mars.png");
  Comet = loadImage("data/Comet.png");
  createStarfield();

  cometXrad = 300;
  cometYrad = 130;
}

void draw() {
  background(0);
  // draw the starfield
  imageMode(CORNER);
  image(sf, 0, 0);
  imageMode(CENTER);
  pushMatrix();
  // draw the sun
  translate(width/2, height/2);
  image(Sun, 0, 0);
  
  // Draw Mercury
  pushMatrix();
  rotate(radians(-20+(frameCount*7.45)));
  pushMatrix();
  translate(60, 0);
  rotate(radians(frameCount));
  image(Mercury, 0, 0);
  popMatrix();
  popMatrix();

  // Draw Venus
  pushMatrix();
  rotate(radians(frameCount*1.63));
  pushMatrix();
  translate(100, 0);
  rotate(radians(frameCount));
  image(Venus, 0, 0);
  popMatrix();
  popMatrix();

  // Draw Earth
  pushMatrix();
  rotate(radians(frameCount));
  pushMatrix();
  translate(140, 0);
  rotate(radians(frameCount));
  image(Earth, 0, 0);
  popMatrix();
  popMatrix();

  // Draw Mars
  pushMatrix();
  rotate(radians(frameCount*0.53));
  pushMatrix();
  translate(180, 0);
  rotate(radians(frameCount));
  image(Mars, 0, 0);
  popMatrix();
  popMatrix();

  // Draw Comet
  pushMatrix();
  cometX = cometXrad * cos(frameCount*0.015);
  cometY = cometYrad * sin(frameCount*0.015);
  translate(-150, 0);
  translate(cometX, cometY);
  rotate(cos(frameCount*0.015) + sin(frameCount*0.015));
  pushMatrix();
  image(Comet, 0, 0);
  popMatrix();
  popMatrix();
  popMatrix();
}

void createStarfield() {
  sf = createGraphics(width, height, P2D);
  sf.beginDraw();
  // draw the stars
  for (int i=0; i<200; i++) {
    sf.pushMatrix();
    sf.stroke(255);
    sf.translate(random(width), random(height));
    sf.point(0, 0);
    sf.popMatrix();
    sf.endDraw();
  }
}


