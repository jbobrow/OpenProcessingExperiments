
//Katherine(Kathy) Y. Lee
//Homework#6 60-257
//Copyright 2012

float bx, by, bxSpeed, bySpeed, bRandom; //for BIRD ONE(black)
float lx, ly, lDiam, lxSpeed; //for BIRD TWO(white)

PImage b, l;


void setup() {
  size(400, 400);
  
  bxSpeed = random(5, 10);
  bySpeed = random(5, 10);
  bRandom = random(100, 300);
  
  bx = bRandom;
  by = 0;
  
  b = loadImage("bird1.png");
  imageMode(CENTER);
  l = loadImage("bird2-1.png");
  imageMode(CENTER);
  
  lx = random(width);
  ly = random(0, 400);
  lDiam = random(10, 30);
  lxSpeed = random(1, 5);
 
  
  
}

void draw() {
  prepWindow();
  drawBird1();
  moveBird1();
  drawBird2();
  moveBird2();
  
}



void prepWindow() {
    PImage img;
    img = loadImage("sky.jpeg");
    background(img);
}


void moveBird1() {
  bx = bx + bxSpeed;
  //bx += bxSpeed;  this will work just as well.
  by = by + bySpeed;
  
  if(bx > width) {
  bx = 0;
  }
  
  if(bx < 0) {
  bx = width;
  }
  
  if(by > height) {
  by = 0;
  }
  
  if(by < 0) {
  by = height;
  
  }
  

}


void drawBird1() {
  image(b, bx, by); 

}







void moveBird2() {
  lx = lx + lxSpeed;
  if (lx > width)
  {
    lxSpeed = -lxSpeed;
  }
  else if (lx < 0)
  {
    lxSpeed = - lxSpeed;
  }
}


void drawBird2() {
    image(l, lx, ly, lDiam, lDiam); 
}

void keyPressed() {
  if (key==' ')
  bx = random (100, 200);
  by = random (100, 200);
  lx = random (50, 300);
  ly = random (50, 300);
  lDiam = random (30, 200);
}

void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}



