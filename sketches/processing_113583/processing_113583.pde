
PImage music;
PImage blue;
PImage yellow;
PImage pink;
PImage leg;
PImage hat3;
//PImage hat1;
PImage hat2;

void setup() {
  size(600, 600);
  imageMode(CENTER);
  music = loadImage("musicnote.jpg");
  blue = loadImage("bluebird.png");
  yellow = loadImage("yellowbird.png");
  pink = loadImage("pinkbird.png");
  leg = loadImage("legs.png");
  hat3 = loadImage("hat3.png");
  //hat1 = loadImage("hat1.png");
  hat2 = loadImage("hat2.png");
  frameRate(random(1, 3.6));
}

void draw() {
  float a = random(100, 150);
  float b = random(250, 290);
  image(music, width/2, height/2, 700, 800);
  image(blue, 450, 200, 250, 250);
  image(pink, 370, 420, 250, 350);
  image(leg, 180, 400, 90, 150);
  image(yellow, 150, 300, 250, 250);
  image(hat3, 210, a, 100, 90);
  //image(hat1, 380, 65, 100, 70);
  image(hat2, 315, b, 100, 90);
}



