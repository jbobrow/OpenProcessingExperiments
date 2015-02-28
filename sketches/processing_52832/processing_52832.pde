
PImage concert;
PImage balloon;
PImage cash;
PImage lila;
PImage mom;
PImage shez;
PImage unclejohn;

void setup() {
 size(1000,900);
concert = loadImage("concert.jpg");
balloon = loadImage("balloon.png");
cash = loadImage("cash.png");
lila = loadImage("lila.png");
mom = loadImage("mom.png");
shez = loadImage("shez.png");
unclejohn = loadImage("unclejohn.png");


imageMode(CENTER);
frameRate(1);
}

void draw() {
image(concert, width/2, height/2, 1000,900);
float x = random(width);
float y = random(height);
float d = random(100,100);
float e = random(300,300);
float f = random(150,150);
frameRate(2);
image(balloon,x,f,f,f);
frameRate(.5);
image(cash,y,y,d,d);
frameRate(1.1);
image(lila, x,x,d,d);
frameRate(.9);
image(mom,x,y,d,d);
frameRate(.7);
image(shez,y,x,e,e);
frameRate(1);
image(unclejohn,y,y,d,d);
}


