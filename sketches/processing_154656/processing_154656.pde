
//Agustey Mongia
//copyright notice

float wrapx = random(200);
float wrapy = random(200);
float bouncex=0;
float bouncey=100;
float wrapsz=75;
float bouncesz=75;
float dx=3;
float dy=3;
float dx1=6;
float dy1=2;
PImage pic1;
PImage pic2;
PImage grass;

void setup()
{
   size(500, 500);
   pic1 = loadImage("Cleats.jpg");
   pic2 = loadImage("Brazuca.jpg");
   grass = loadImage("1.jpg");
};

void draw()
{
  background(0);
  //Brazuca ball
  image(pic2, bouncex, bouncey, bouncesz, bouncesz);
  bouncex += dx1;
  bouncey += dy1;
  //Cleat
  image(pic1, wrapx, wrapy, wrapsz, wrapsz);
  wrapx = wrapx + dx;
  wrapy = wrapy + dy;
  noFill();
  strokeWeight(10);
  ellipse(wrapx+37.5, wrapy+37.5, wrapsz, wrapsz);
  
  //wrapping
  if (wrapx > width || wrapy > height)
  {
    wrapx = random(width);
    wrapy = random(0);
  };
  
  //bouncing
  if (bouncex + bouncesz > width || bouncex < 0)
  {
    dx1=-dx1;
  };
  
  if (bouncey + bouncesz > height || bouncey < 0)
  {
    dy1=-dy1;
  };
  
  //collision
  float d=dist(bouncex, bouncey, wrapx, wrapy);
  if (d<50)
  {
    fill(0,255,0);
    rect(0, 0, width, height);
    textSize(100);
    textAlign(CENTER, CENTER);
    fill(0);
    text("GOAL!", 250, 250);
  };
}


