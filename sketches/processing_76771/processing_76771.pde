
float x = 200;
float y = 660;

float a = 2;
float b = 2;
float c = 2;
float d = 2;
float e = 2;
float f = 2;
float g = 2;
float h = 2;
float i = 2;
float j = 2;
float k = 2;

float xx1 = 350;
float xx2 = 225;
float xx3 = 50;
float xx4 = 300;
float xx5 = 100;
float xx6 = 275;
float xx7 = 150;
float xx8 = 75;
float xx9 = 200;
float xx10 = 375;
float xx11 = 250;

float yy1 = 600;
float yy2 = 550;
float yy3 = 500;
float yy4 = 450;
float yy5 = 400;
float yy6 = 350;
float yy7 = 300;
float yy8 = 250;
float yy9 = 200;
float yy10 = 150;
float yy11 = 100;

float max_distance;
float dist1 = 10;
float dist2 = 10;
float dist3 = 10;
float dist4 = 10;
float dist5 = 10;
float dist6 = 10;
float dist7 = 10;
float dist8 = 10;
float dist9 = 10;
float dist10 = 10;
float dist11 = 10;
float dist12 = 10;

float linex = 200;
float liney = 40;

float game = 0;

PImage[] images = new PImage[2];
void setup() {
  size (400, 700);
  smooth ();
  images[0] = loadImage("loser.png");
  images[1] = loadImage("winner.png");
  max_distance = dist(0, 0, 400, 700);
}

void draw() {
  background(random(255));
  //background(#3ACEC0);
  noStroke();

  xx1 = xx1 + a;
  xx2 = xx2 + b;
  xx3 = xx3 + c;
  xx4 = xx4 + d;
  xx5 = xx5 + e;
  xx6 = xx6 + f;
  xx7 = xx7 + g;
  xx8 = xx8 + h;
  xx9 = xx9 + i;
  xx10 = xx10 + j;
  xx11 = xx11 + k;

  fill(0);
  rect(xx1, yy1, 20, 20);
  rect(xx2, yy2, 20, 20);
  rect(xx3, yy3, 20, 20);
  rect(xx4, yy4, 20, 20);
  rect(xx5, yy5, 20, 20);
  rect(xx6, yy6, 20, 20);
  rect(xx7, yy7, 20, 20);
  rect(xx8, yy8, 20, 20);
  rect(xx9, yy9, 20, 20);
  rect(xx10, yy10, 20, 20);
  rect(xx11, yy11, 20, 20);

  if (xx1 > 380) {
    xx1 = 380;
    a = -a - 3;
  }
  if (xx1 < 0) {
    xx1 = 0;
    a = -a + 3;
  }

  if (xx2 > 380) {
    xx2 = 380;
    b = -b - 3;
  }
  if (xx2 < 0) {
    xx2 = 0;
    b = -b + 3;
  }
  if (xx3 > 380) {
    xx3 = 380;
    c = -c - 3;
  }
  if (xx3 < 0) {
    xx3 = 0;
    c = -c + 3;
  }
  if (xx4 > 380) {
    xx4 = 380;
    d = -d - 3;
  }
  if (xx4 < 0) {
    xx4 = 0;
    d = -d + 3;
  }
  if (xx5 > 380) {
    xx5 = 380;
    e = -e - 3;
  }
  if (xx5 < 0) {
    xx5 = 0;
    e = -e + 3;
  }
  if (xx6 > 380) {
    xx6 = 380;
    f = -f - 3;
  }
  if (xx6 < 0) {
    xx6 = 0;
    f = -f + 3;
  }
  if (xx7 > 380) {
    xx7 = 380;
    g = -g - 3;
  }
  if (xx7 < 0) {
    xx7 = 0;
    g = -g + 3;
  }
  if (xx8 > 380) {
    xx8 = 380;
    h = -h - 3;
  }
  if (xx8 < 0) {
    xx8 = 0;
    h = -h + 3;
  }
  if (xx9 > 380) {
    xx9 = 380;
    i = -i - 3;
  }
  if (xx9 < 0) {
    xx9 = 0;
    i = -i + 3;
  }
  if (xx10 > 380) {
    xx10 = 380;
    j = -j - 3;
  }
  if (xx10 < 0) {
    xx10 = 0;
    j = -j + 3;
  }
  if (xx11 > 380) {
    xx11 = 380;
    k = -k - 3;
  }
  if (xx11 < 0) {
    xx11 = 0;
    k = -k + 3;
  }


  strokeWeight(2);
  stroke(0);
  fill(255);
  rect(175, 25, 50, 50);
  
 
  if (game > 9) {
    image(images[0], 0, 0);
    mouseX = -100;
    mouseY = -100;
  }

  if (game < -9) {
    image(images[1], 0, 0);
    mouseX = -100;
    mouseY = -100;
  }



  fill(255);
  noStroke();
  translate(mouseX, mouseY);
  triangle(-20, 20, 20, 20, 0, -20);
  
 
  if (x < -180) {
    x = -180;
  }
  if (x > 180) {
    x = 180;
  }
  if (y > 20) {
    y = 20;
  }
  if (y < - 640) {
    y = -640;
  }

  dist1 = dist(mouseX, mouseY, xx1, yy1);
  if (dist1 < 40) {
    game = 10;
    //background(255, 0, 0);
  }
  dist2 = dist(mouseX, mouseY, xx2, yy2);
  if (dist2 < 40) {
    game = 10;
    //background(255, 0, 0);
  }
  dist3 = dist(mouseX, mouseY, xx3, yy3);
  if (dist3 < 40) {
    game = 10;
    //background(255, 0, 0);
  }
  dist4 = dist(mouseX, mouseY, xx4, yy4);
  if (dist4 < 40) {
    game = 10;
    //background(255, 0, 0);
  }
  dist5 = dist(mouseX, mouseY, xx5, yy5);
  if (dist5 < 40) {
    game = 10;
    //background(255, 0, 0);
  }
  dist6 = dist(mouseX, mouseY, xx6, yy6);
  if (dist6 < 40) {
    game = 10;
    //background(255, 0, 0);
  }
  dist7 = dist(mouseX, mouseY, xx7, yy7);
  if (dist7 < 40) {
    game = 10;
    //background(255, 0, 0);
  }
  dist8 = dist(mouseX, mouseY, xx8, yy8);
  if (dist8 < 40) {
    game = 10;
    //background(255, 0, 0);
  }
  dist9 = dist(mouseX, mouseY, xx9, yy9);
  if (dist9 < 40) {
    game = 10;
    //background(255, 0, 0);
  }
  dist10 = dist(mouseX, mouseY, xx10, yy10);
  if (dist10 < 40) {
    game = 10;
    //background(255, 0, 0);
  }
  dist11 = dist(mouseX, mouseY, xx11, yy11);
  if (dist11 < 40) {
    game = 10;
  }


  dist12 = dist(mouseX, mouseY, linex, liney);
  if (dist12 < 40) {
    game = -10;
  }
}


