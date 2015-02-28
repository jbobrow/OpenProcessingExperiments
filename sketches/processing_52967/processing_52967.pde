
//Collage render - Paul Rivera

PImage usmask;
PImage mine1;
PImage mine2;
PImage mine3;
PImage bg;
float cover;
float x, y;
float x1, y1;
float x2, y2;
float m;


void setup() {
  size(500, 500);
  frameRate(1);
  usmask = loadImage ("us.gif");
  mine1 = loadImage("mine1.gif");
  mine2 = loadImage("mine2.gif");
  mine3 = loadImage("mine3.gif");
  bg = loadImage ("bg.gif");
  cover = 255;
  m = map(mouseY, 0, 500, 0, 500);   

  rectMode(CENTER);
  imageMode (CENTER);

  smooth();
}
void draw() {
  background(0);
  float x = random(250, 260);
  float y = random(220, 260);
  float x1 = random(240, 250);
  float y1 = random(250, 290);
  float x2 = random(280, 300);
  float y2 = random(270, 300);


  image(bg, width/2, height/2);
  image(mine3, x2, y2, 480, 480);
  image(mine2, x1, m+y1-10, 470, 470);
  image(mine1, x, m+y);

  fill(151, 229, 51, 1);
  rect (width/2, height/2, 500, 500);
  image(usmask, width/2, height/2);


  //  if ((mouseY>100) && (mouseY<450)) {
  //    cover = cover-255; //fix me!
  //  }
  //  else if((mouseY<100) || (mouseY>450)){
  //    cover = cover+255;
  //  }
}


