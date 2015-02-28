
// project 3, collage
// dma fall 2010, brian phan

// variables

PFont gotham;
PImage bg;
PImage boy;
PImage brew;
PImage chair;
PImage coffee;
PImage girl;
PImage palmier;
PImage computer;
PImage sugar;
PImage starbucks;
float x, y, r;

// setup

void setup()
{
  size(640, 480);
  background(255);
  bg = loadImage ("bg.png");
  boy = loadImage ("boy.png");
  brew = loadImage ("brew.png");
  chair = loadImage ("chair.png");
  coffee = loadImage ("coffee.png");
  girl = loadImage ("girl.png");
  computer = loadImage ("computer.png");
  sugar = loadImage ("sugar.png");
  palmier = loadImage ("palmier.png");
  starbucks = loadImage ("starbucks.png");
  gotham = loadFont ("Gotham-Bold-48.vlw");
  smooth();
  noLoop();
  imageMode(CENTER);
}

void draw()
{ 
  image(bg, 320, 230, 670, 480);
  textFont(gotham);
  fill(0);
  text("boy meets girl", 150, 230);
  
  x = random(width);
  y = random(height);
  r = random(0, 60);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(brew, brew.width/2, brew.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, 60);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(chair, chair.width/2, chair.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, 60);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(coffee, coffee.width/2, coffee.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, 60);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(starbucks, starbucks.width/2, starbucks.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, 60);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(computer, computer.width/2, computer.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, 60);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(sugar, sugar.width/2, sugar.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, 60);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(palmier, palmier.width/2, palmier.height/2);
  popMatrix();

  x = random(width);
  y = random(height);
  r = random(0, 60);
  pushMatrix();
  translate(x, y);
  rotate(r);
  fill(0);
  text("decaf please..", width, height);
  popMatrix();
}

void mousePressed ()
{
  redraw();
  background(255);
}

