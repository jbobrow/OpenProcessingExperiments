
PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;

void setup() {
  size(1024, 768);
  float randomr;
  randomr = random(255);
  float randomg;
  randomg = random(100);
  float randomb;
  randomb = random(50);
  fill(randomr,randomg,randomb);
  noStroke();

  img = loadImage("Penguins0.jpg");
  img2 = loadImage("Penguins.jpg");
  img3 = loadImage("PenguinsBW.jpg");
  img4 = loadImage("Penguins2.jpg");
  img5 = loadImage("Penguins3.jpg");
}
void draw() {
  float randomw;
  randomw = random(1024);
  float randomh;
  randomh = random(768);
  float randomW1;
  randomW1 = random(100);
  float randomW2;
  randomW2 = random(25);
  float randomH1;
  randomH1 = random(75);
  float randomH2;
  randomH2 = random(50);
  float randomR;
  randomR = random(60);

if (mousePressed&&(mouseButton == LEFT))
background(img2);
if (mousePressed&&(mouseButton == LEFT))
{rotate(radians(randomR));
rect(randomw,randomh,randomW1 + randomW2,randomH1 + randomH2);
}
else if (mousePressed&&(mouseButton == RIGHT))
background(img3);
else if (mousePressed&&(mouseButton == CENTER))
background(img4);
else if (keyPressed == true)
background(img5);
else background(img);
}

