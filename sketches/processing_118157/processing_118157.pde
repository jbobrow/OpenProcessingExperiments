
import ddf.minim.*;
PImage bkg, boy, girl, ship, duck, cloud, cloud2, cloud3, hello;
float boyX, boyY, girlX, girlY, shipX, shipY, duckX, duckY, cloudX, cloudY, cloud2X, cloud2Y, cloud3X,cloud3Y;

Minim minim;
AudioSample hellosound;
AudioPlayer bkgsound;

void setup() {
  size(800, 400);
  minim = new Minim(this);
  imageMode(CENTER);
  bkg = loadImage("bkg.png");
  boyX=420;
  boyY=200;
  girlX=50;
  girlY=350;
  shipX=250;
  shipY=400;
  duckX=100;
  duckY=400;
  cloudX=50;
  cloudY=50;
  cloud2X=400;
  cloud2Y=350;
  cloud3X=750;
  cloud3Y=50;
  boy = loadImage("boy.png");
  girl = loadImage("girl.png");
  ship = loadImage("ship.png");
  duck = loadImage("duck.png");
  cloud = loadImage("cloud.png");
  cloud2 = loadImage("cloud2.png");
  cloud3 = loadImage("cloud3.png");
  hello = loadImage("hello.png");

  
  hellosound = minim.loadSample("hellosound.mp3");
  bkgsound = minim.loadFile("bkgsound.mp3");
  bkgsound.loop();
}

void draw() {
  frameRate(10);
  image(bkg, 400, 200);
  boyX+=random(-3, 3);
  boyY+=random(-3, 3);
  boyX = constrain(boyX, 400, 420);
  boyY = constrain(boyY, 180, 200);
  girlX+=random(-3, 3);
  girlY+=random(-3, 3);
  girlX = constrain(girlX, 40, 50);
  girlY = constrain(girlY, 300, 350);
  shipX+=random(-3, 3);
  shipY+=random(-3, 3);
  shipX = constrain(shipX, 250, 300);
  shipY = constrain(shipY, 150, 200);
  duckX+=random(-3, 3);
  duckY+=random(-3, 3);
  duckX = constrain(duckX, 150, 200);
  duckY = constrain(duckY, 200, 230);
  cloudX+=random(-3, 3);
  cloudY+=random(-3, 3);
  cloudX = constrain(cloudX, 20, 50);
  cloudY = constrain(cloudY, 20, 50);
  cloud2X+=random(-3, 3);
  cloud2Y+=random(-3, 3);
  cloud2X = constrain(cloud2X, 400, 450);
  cloud2Y = constrain(cloud2Y, 300, 350);
  cloud3X+=random(-3, 3);
  cloud3Y+=random(-3, 3);
  cloud3X = constrain(cloud3X, 700, 750);
  cloud3Y = constrain(cloud3Y, 20, 50);
  image(boy, boyX, boyY);
  image(girl, girlX, girlY);
  image(ship, shipX, shipY);
  image(duck, duckX, duckY);
  image(cloud, cloudX, cloudY);
  image(cloud2, cloud2X, cloud2Y);
  image(cloud3, cloud3X, cloud3Y);
  
  drawGreenTrees(50, 130);
  drawGreenTrees(300, 50);
  drawGreenTrees(500, 250);
  drawGreenTrees(750, 150);
  drawWhiteTrees(200, 80);
  drawWhiteTrees(250, 330);
  drawWhiteTrees(580, 180);
  
  if (mousePressed) {

    if (mouseX>250 && mouseY<300) {
      hellosound.trigger();
      image(hello, boyX+30, boyY-30);
    }
    else if (mouseX<200 && mouseY>200) {
      hellosound.trigger();
      image(hello, girlX+30, girlY-30);
    }
}
}


void drawGreenTrees (int x, int y){
  noStroke();
  rectMode(CENTER);
  fill(78, 69, 41);
  rect(x, y+25, 15, 30);
  fill(92, 136, 87);
  ellipse(x, y, 45, 45);
}

void drawWhiteTrees (int x, int y){
  fill(78, 69, 41);
  rect(x, y+25, 15, 30);
  fill(239, 231, 210);
  ellipse(x, y, 45, 45);
}


