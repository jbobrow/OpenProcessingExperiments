
//Katherine(Kathy) Y. Lee
//HW#6
//Copyright 2012

PImage bgImage, hanselGretel, trees;
float s, sHeight, sWidth, horizon, mX, mY;
boolean bird, bird2 = false;
int speed = 1;
int x = 0;
float birdX, randomBird;


//-------------------------------//

void setup() {
  size(400,400);
  smooth();  
  //noCursor();
  bgImage = loadImage("Hansel-and-Gretel-illustration3.jpg");
  hanselGretel = loadImage("hanselandgretel.png");
  trees = loadImage("trees.png");
  horizon = 130;

  birdX = 0;
  randomBird = random(50, 150);
}

//-------------------------------//


void draw() {

  background(bgImage); // background
  drawBird();
  drawHanselAndGretel();
  drawTrees();
  bounceBird2();
  //println("mouse X:" + mouseX + "   mouse Y:  " + mouseY);

  
}


//-------------------------------//

void drawHanselAndGretel() {
  mX = mouseX; //set mX
  if (mouseY >= horizon) {
    mY = mouseY;
  } else {
    mY = horizon; 
  }
  s = map(mY,horizon,height, .8 , 1.5); //this requires a lot of ur brain to understand
  sHeight = s * hanselGretel.height;
  sWidth = s * hanselGretel.width;
  image(hanselGretel,mX-sWidth/2,mY-sHeight/2,sWidth,sHeight);
}

void drawBird() {
  if (bird == true) {
    PImage img;
  img = loadImage("bird.png");
  image(img, birdX, randomBird);
     birdX+=5;
  } 
  if (birdX > width) {
    bird = false;
    birdX = 0;
    
  }
    
}

void keyPressed() {
  if (key == '1') {
    bird = true;
    }
  if (key == '2') {
    bird2 = true;
    }
}


void drawTrees() {
  PImage tree;
    tree = loadImage("trees.png");
    image(tree,0,0);
    
}

void bounceBird2() {  
  int x = 200;
  int y = 281;
  
  if (bird2 == true) {
    PImage bird2;
    bird2 = loadImage("bird2.png");
    image(bird2, x, y);
  }
    y = y + speed;
    println (y);
    if (y > height || y < 0 )
    {
    speed = speed*-1;
    }
    }
  

  

