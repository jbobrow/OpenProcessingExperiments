
/* @pjs preload = "back.png";*/
/* @pjs preload = "back.png, watermelon.png, banana.png, coffee.png, beer.png, usb.png, cheese.png"; */ 


//i'm working on it still
//the idea is to make the background appear when you 'kill' the ants
//and then see the invite for the picnic
//tried to use some library (but they don't work on the java script


//import g4p_controls.*;


PImage watermelon, banana, coffee, beer, usb, cheese, background;
float wX, wY, bX, bY, cX, cY, rX, rY, uX, uY, sX, sY;
float speed;
//GButton b1, b2, b3;

void setup () {
  size (900, 900); 
  background = loadImage ("back.png");
  watermelon = loadImage ("watermelon.png");
  banana = loadImage ("banana.png");
  coffee= loadImage ("coffee.png");
  beer= loadImage ("beer.png");
  usb = loadImage ("usb.png");
  cheese = loadImage ("cheese.png");
  speed = 1.1;
  wX = (-1);
  wY = (random (800));
  bX = (-1);
  bY = (random (800));
}

void draw () {
  /*here I can load some buttons to create the interaction*/
//  b1 = new GButton(this, 750, 30, 130, 40);
//  b2 = new GButton(this, 750, 80, 130, 100);
//  b3 = new GButton(this, 750, 190, 130, 80);
//  
 
  image (background, 0,0);
  image (watermelon, wX, wY);
  image (banana, bX, bY);
//  image (coffee, c1, c2);
//  image (beer, r1, r2);
//  image (usb, u1, u2);
//  image (cheese, s1, s2);


  wX+=speed;
  bX+=speed;
  
  
}



