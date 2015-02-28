

PImage ben2;
PImage ben3;
PImage ben4;
PImage maskk;
PImage colorz;

void setup () {
  size(700, 500);
  smooth();
  ben2 = loadImage("benson2.JPG");
  ben3 = loadImage("benson3.JPG");
  ben4 = loadImage("benson4.jpg");
  maskk = loadImage("maskk.jpg");
  colorz = loadImage("rightmask-01.jpg");

  imageMode(CENTER);
  frameRate(1);
}


void draw()
{


  tint(255, 255);
  image(ben3, width/2, height/2, 800, 600);

  float a=random(1, 4);
  tint(255, 120);
  pushMatrix();
  translate(280, 162);
  rotate(PI/a);
  image(colorz, 0, 0 );
  popMatrix();

  float b=random(1, 4);
  pushMatrix();
  translate(417, 159);
  rotate(PI/b);
  image(colorz, 0, 0);
  popMatrix();


  ben3.mask(maskk);
  float r=random(150, 255);
  tint(r, 255, 255, 255);
  image(ben3, width/2, height/2, 800, 600);

  float yello=random(210, 250);
  float yellox=random(310, 380);
  tint(255, 255, 150, 50);
  image(ben2, yellox, yello, 800, 600);

  float pinky=random(240, 280);
  float pinkyx=random(330, 395);
  tint(255, 150, 255, 50);
  image(ben4, pinkyx, pinky, 800, 600);
}


