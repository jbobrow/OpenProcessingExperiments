
PImage fossilbed;
PImage fossil0;
PImage fossil2;
PImage fossil3;
PImage fossil4;
PImage fossil5;
PImage fossil7;

float x, y, r;

void setup() {
  size (900, 661);

  fossilbed = loadImage("fossilbed.png");
  fossil0 = loadImage("fossil0.png");
  fossil2 = loadImage("fossil2.png");
  fossil3 = loadImage("fossil3.png");
  fossil4 = loadImage("fossil4.png");
  fossil5 = loadImage("fossil5.png");
  fossil7 = loadImage("fossil7.png");

  smooth();
  noLoop();
  imageMode(CENTER);
}

void draw() {
  if (mousePressed == true) {
    noCursor();
  } 
  else {
    noCursor();
  }
  image(fossilbed, width/2, height/2);

  pushMatrix();
  x = random(0, width);
  y = random(0, height);
  r = random(0, 40);
  translate(x, y);
  rotate(r);
  image(fossil0, 0, 0);
  popMatrix();

  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(0, 40);
  translate(x, y);
  rotate(r);
  image(fossil2, 0, 0);
  popMatrix();

  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(0, 40);
  translate(x, y);
  rotate(r);
  image(fossil3, 0, 0);
  popMatrix();

  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(0, 40);
  translate(x, y);
  rotate(r);
  image(fossil4, 0, 0);
  popMatrix();

  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(0, 40);
  translate(x, y);
  rotate(r);
  image(fossil5, 0, 0);
  popMatrix();

  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(0, 40);
  translate(x, y);
  rotate(r);
  image(fossil7, 0, 0);
  popMatrix();
}

void mousePressed ()
{
  redraw();
}



