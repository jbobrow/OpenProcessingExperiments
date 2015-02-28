
PVector locationRectBelow;
PVector locationRectAbove;
PVector velocityRect;
int rectHeight=20;
int rectWidth=60;
int rectBelow=1;
int cy = 100;
int cx = 90;
boolean follow=false;
boolean start = false;
int numLives=3;
PFont fonts;
boolean gameOver;
boolean restart;


void setup() {
  size(200, 200);
  smooth();
  background(255);
  locationRectBelow = new PVector(100, 100);
  locationRectAbove= new PVector(100, 100-rectHeight);
  velocityRect = new PVector(0, 1);
  // fonts = loadFont("Aparajita-Bold-48.vlw");
}

void draw() {
  frameRate(120);

  if (start == false&&numLives==3||restart) {  

    background(255);  

    //textFont(fonts);

    fill(24, 60, 150);  

    text("Click to Start", 100, 55);
  } 
  else if (start==true&&numLives!=0&&!gameOver) {
    // start=true;

    background(0);
    PFont font2= loadFont("Aparajita-Bold-48.vlw");
    textFont(font2, 15);
    fill(0, 255, 255);

    noStroke();
    fill(255);
    background(255);


    if (locationRectBelow.y>=100&&locationRectBelow.y<150&&rectBelow==1) {
      locationRectBelow.add(velocityRect);
      locationRectAbove.sub(velocityRect);
    }
    if (locationRectBelow.y==150||locationRectBelow.y==100) {
      rectBelow*=-1;
    }

    if (rectBelow==-1||locationRectBelow.y>150) {
      locationRectBelow.sub(velocityRect);
      locationRectAbove.add(velocityRect);
    }

    noStroke();
    fill(0);
    ellipse(cx, cy, 10, 10);
    if (mousePressed&&dist(mouseX, mouseY, 90, 100)<10||mousePressed&&follow==true||mousePressed&&dist(mouseX, mouseY, cx, cy)<10) {
      ellipse(mouseX, mouseY, 10, 10);
      follow=true;
      cx=mouseX;
      cy=mouseY;
      println(cx + " "+cy);
    }
    if (!mousePressed) {
      follow=false;
    }
    rect(locationRectBelow.x, locationRectBelow.y, rectWidth, rectHeight);
    rect(locationRectAbove.x, locationRectAbove.y, rectWidth, rectHeight);
    checkCollision();
  }
}

void checkCollision() {
  if (cx>locationRectBelow.x&&cx<locationRectBelow.x+60) {
    if (abs(cy-locationRectBelow.y)<=10||abs(cy-locationRectAbove.y)<=10) {
      gameOver();
    }
  }
}

void mouseClicked() {
  start=true;
}

void gameOver() {
  gameOver=false;
  numLives--;
  start=false;
  println(numLives + " " + start);
  if (numLives>0) {
    fill(24, 60, 150);  
    while (start==false) {
      println("start " + start);
      fill(24, 60, 150);  

      text("Try Again?", 50, 0);
    }
    if (start=true) {
      println("start " + start);

      restart=true;
    }
  }
}


