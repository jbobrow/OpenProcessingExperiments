
PImage music;
PImage blue;
PImage pink;
PImage yellow;
PImage leg;
PImage hat1;
PImage hat2;
PImage hat3;

void setup() {
  size(600, 600);
  smooth(0);
  imageMode(CENTER);
  music = loadImage("musicnotes.jpg");
  blue = loadImage("bluebird.png");
  pink = loadImage("pinkbird.png");
  yellow = loadImage("yellowbird.png");
  leg = loadImage("legs.png");
  hat1 = loadImage("hat1.png");
  hat2 = loadImage("hat2.png");
  hat3 = loadImage("hat3.png");
  frameRate(random(1, 2.8));
}

void draw() {
  float a = random(50,100);
  float b = random(100,155);
  float c = random (280,340);
   
  image(music, width/2, height/2, 600, 600);
  
  noStroke();
  fill(random(255), random(255), random(255), 60);
  rect(0,0,width,height);
   
  image(leg, 180, 390, 90, 150);
  image(blue, 450, 230, 270, 297);
  image(pink, 370, 450, 270, 270);
  image(yellow, 150, 270, 300, 250);
  image(hat1, 370, a, 100, 75);
  image(hat2, 220, b, 100,75);
  image(hat3, 315, c, 100,75);
}




