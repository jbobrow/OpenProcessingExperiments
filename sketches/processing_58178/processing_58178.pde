
int x = 0;
int y = 50;
int a = 80;
int b = 200;
int c = 200;
int d = 450;

int z = 550; 
int w = 500;
int f = 350;
int g = 280;
int h = 530; 
int i = 400;

int waterLevel = 50;
int waterRaise = 0;

int k = 50;
int k2 = waterLevel - (height - 50);

int direction = 1;
int direction2 = 1;
int direction3 = 1;
int direction4 = 1;
int direction5 = 1;
int direction6 = 1;

int runout = -12000;
int espera = 1000;

PImage eye_green_1;
PImage eye_green_2;
PImage eye_green_3;
PImage eye_green_4;
PImage eye_green_5;
PImage eye_green_6;

PImage eye_green_right;
PImage eye_green_left;
PImage eye_red_right;
PImage eye_red_left;

PImage water;

int fundo = color(200,250,255);



void setup() {
  size(600, 600);
  smooth();
  eye_green_1 = loadImage("eye_green_right.png");
  eye_green_2 = loadImage("eye_green_right.png");
  eye_green_3 = loadImage("eye_green_right.png");
  eye_green_4 = loadImage("eye_green_left.png");
  eye_green_5 = loadImage("eye_green_left.png");
  eye_green_6 = loadImage("eye_green_left.png");
  
  eye_green_right = loadImage("eye_green_right.png");
  eye_green_left = loadImage("eye_green_left.png");
  
  eye_red_right = loadImage("eye_red_right.png");
  eye_red_left = loadImage("eye_red_left.png");
  
  water = loadImage("water.png");
}

void draw() {
  background(fundo);
  image(water, 0,waterLevel, 600,600);
  
  leftright1();
  leftright2();
  leftright3();
  rightleft1();
  rightleft2();
  rightleft3();
  
  image(water, 0,waterLevel, 600,600);
  
   if (mousePressed) {
    waterLevel = waterLevel + 10;
  }

  if ( mousePressed && waterLevel >= height ) {
    runout = millis();
    fundo = color(0,0,0);
    eye_green_right = loadImage("eye_red_right.png");
    eye_green_left = loadImage("eye_red_left.png");
  }
  
  else if (waterLevel < height - k) { 
    fundo = color(200,250,255);
    eye_green_right = loadImage("eye_green_right.png");
    eye_green_left = loadImage("eye_green_left.png");
  }

  if (millis() > runout + espera && millis() < runout + espera + 10000 ) {
    waterRaise = -1;
    
    
  } 
  else { 
    waterRaise = 0;
  }

  waterLevel = waterLevel + waterRaise;
  
}




void leftright1() {
  image(eye_green_1, x ,y , 50, 50);
  x = x + direction;
  if (pmouseY < y - 5 && mouseX > x && mouseX < x + 50) {
    y = y + 2;
  }
  else if (pmouseY > y + 5 && mouseX > x && mouseX < x + 50) {
    y = y - 2;
  }
  
  else if (x > width - 50) {
    direction = -1;
    eye_green_1 = eye_green_left;
    
  }
  else if (x < 0 ) {
    direction = 1;
    eye_green_1 = eye_green_right;
  }
  
  if (y > height - 50) {
    y = y - 2;
  }
  else if (y < waterLevel ) {
    y = y + 2;
  }
}

void leftright2() {
  image(eye_green_2, a, b, 50, 50);
  a = a + direction2;
  if (pmouseY < b - 5 && mouseX > a && mouseX < a + 50) {
    b = b + 2;
  }
  else if (pmouseY > b + 5 && mouseX > a && mouseX < a + 50) {
    b = b - 2;
  }
  if (a > width - 50) {
    direction2 = -1;
    eye_green_2 = eye_green_left;
  }
  else if (a < 0 ) {
    direction2 = 1;
    eye_green_2 = eye_green_right;
  }
  if (b > height - 50) {
    b = b - 2;
  }
  else if (b < waterLevel ) {
    b = b + 2;
  }
}

void leftright3() {
  image(eye_green_3, c, d, 50, 50);
  c = c + direction3;
  if (pmouseY < d - 5 && mouseX > c && mouseX < c + 50) {
    d = d + 2;
  }
  else if (pmouseY > d + 5 && mouseX > c && mouseX < c + 50) {
    d = d - 2;
  }
  if (c > width - 50) {
    direction3 = -1;
    eye_green_3 = eye_green_left;
  }
  else if (c < 0 ) {
    direction3 = 1;
    eye_green_3 = eye_green_right;
  }
  if (d > height - 50) {
    d = d - 2;
  }
  else if (d < waterLevel ) {
    d = d + 2;
  }
}

///right to left
void rightleft1() {

  image(eye_green_4, z, w, 50, 50);
  z = z - direction4;
  if (pmouseY < w - 5 && mouseX > z && mouseX < z + 50 ) {
    w = w + 2;
  }
  else if (pmouseY > w + 5 && mouseX > z && mouseX < z + 50) {
    w = w - 2;
  }
  if (z < 0) {
    direction4 = -1;
    eye_green_4 = eye_green_right;
  }
  else if (z > width - 50) {
    direction4 = 1;
    eye_green_4 = eye_green_left;
  }
  if (w > height - 50) {
    w = w - 2;
  }
  else if (w < waterLevel ) {
    w = w + 2;
  }
}
  
 void rightleft2() {

  image(eye_green_5, f, g, 50, 50);
  f = f - direction5;
  if (pmouseY < g - 5 && mouseX > f && mouseX < f + 50 ) {
    g = g + 2;
  }
  else if (pmouseY > g + 5 && mouseX > f && mouseX < f + 50) {
    g = g - 2;
  }
  if (f < 0) {
    direction5 = -1;
    eye_green_5 = eye_green_right;
  }
  else if (f > width - 50) {
    direction5 = 1;
    eye_green_5 = eye_green_left;
  }
  if (g > height - 50) {
    g = g - 2;
  }
  else if (g < waterLevel ) {
    g = g + 2;
  }
 }
 
 void rightleft3() {

  image(eye_green_6, h, i, 50, 50);
  h = h - direction6;
  if (pmouseY < i - 5 && mouseX > h && mouseX < h + 50 ) {
    i = i + 2;
  }
  else if (pmouseY > i + 5 && mouseX > h && mouseX < h + 50) {
    i = i - 2;
  }
  
  if (h < 0) {
    direction6 = -1;
    eye_green_6 = eye_green_right;
  }
  else if (h > width - 50) {
    direction6 = 1;
    eye_green_6 = eye_green_left;
  }
  
  if (i > height - 50) {
    i = i - 2;
  }
  else if (i < waterLevel ) {
    i = i + 2;  
  }
 }
 

 





