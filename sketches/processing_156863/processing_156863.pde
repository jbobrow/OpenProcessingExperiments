
PImage superman;
float posYsuper = 600;
PImage bullet;
float posYbullet = 700;
PImage train;
float posXtrain = 1000;
float wTrain = 200;
float hTrain = 200;
PFont subtext;

void setup(){
  size (1000, 750);
  imageMode(CENTER);
  superman = loadImage("superman.jpg");
  bullet = loadImage("bullet.gif");
  train = loadImage("train.png");
  subtext = loadFont("DilleniaUPCBold-48.vlw");
}

void draw(){
  background(255);
  
  image(superman, width/2, posYsuper, 300, 400);
  posYsuper -= 8;
  image(bullet, 50, posYbullet, 100, 100);
  posYbullet -= 3;
  image(train, posXtrain, height/2, wTrain, hTrain);
  posXtrain -= 5;
  wTrain *= 1.01;
  hTrain *= 1.01;
  
  textAlign(CENTER);
  textFont(subtext, 70);
  fill(255, 0, 5);
  text("Faster than a speeding bullet!", width/2+(random(-50,50)), height-50);
}


