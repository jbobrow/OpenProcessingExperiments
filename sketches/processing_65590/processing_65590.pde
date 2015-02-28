
// to use an image in processing you need to use a PImage
PImage kitten;
PImage scene;


float kittenX = 0.0;// x location
float kittenY = 0.0;// y location
float kittenA = 0.0;// angle
float kittenS = 1.0;// scale

float kittenXmov = 0.0;// change in x location
float kittenXmovChg = 0.0;// change in x location
float kittenYmov = 0.0;// change in y location
float kittenYmovChg = 0.0;// change in y location
float kittenArot = 0.0;// change in angle
float kittenSrat = 0.0;// change in scale

float initA = 0.0;// initial angle
void setup() {
  size(700, 500);
  smooth();
  kitten = loadImage("data/seed.png");
  scene = loadImage("data/space.png");
  //scene = loadImage("data/fishTank.png");

  imageMode(CENTER);

  initKitten();
}

void draw() {

  updateKitten();

  renderKitten();
}

void mousePressed() {
  initKitten();
}

void initKitten() {
  kittenX = width/2;
  kittenY = height/2;
  //kittenX = random(width);
  //kittenY = random(height);
  
  kittenA ++;
  kittenS = 0.50;
  
  initA += 2.0;

  kittenXmov = sin( radians(initA) ) * 10.0;
  kittenXmovChg = random( -0.03, 0.03);
  kittenYmov = cos( radians(initA) ) * 10.0;
  kittenYmovChg = random( -0.03, 0.03);
  kittenArot = 5.0;
  kittenSrat = random(-0.009, -0.001);
}

void updateKitten() {
  // update positional values
  kittenX += kittenXmov;
  kittenY += kittenYmov;
  //kittenXmov += kittenXmovChg;
  //kittenYmov += kittenYmovChg;
  kittenA += kittenArot;
  kittenS += kittenSrat;

  // check to see if kitten is out of bounds
  if (kittenS <= 0.01) {
    initKitten();
  }
  else if ( kittenX < -kitten.width/2 || kittenX >= width + (kitten.width/2)) {
    initKitten();
  }
  else if ( kittenY < -kitten.height/2 || kittenY >= height + (kitten.height/2)) {
    initKitten();
  }
}

void renderKitten() {
  pushMatrix();
  translate(kittenX, kittenY);
  rotate(radians(kittenA));
  image(kitten, 0, 0, kitten.width * kittenS, kitten.height * kittenS );// image(PImage, x, y);
  popMatrix();
}


