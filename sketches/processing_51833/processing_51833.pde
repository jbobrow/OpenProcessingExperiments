
PImage mysnow1;
PImage apple;
PImage bapple;

void setup() {
  size(600, 300);
  mysnow1 = loadImage("mysnow1.png");
  apple = loadImage ("apple.png");
  bapple = loadImage ("bapple.png");
  frameRate(1);
  imageMode(CENTER);
}

void draw() {
  background(37, 23, 52);
  float x = random(width);
  float y = random(height);
  float d = random(100, 300);
  image(mysnow1, x, y, d, d);

  float a = random (25, 50);
  float x1= random (100, 500);
  float y1= random (50, 290);
  image (apple, x1, y1, a, a);

  float a2 = random (10, 20);
  float x2= random (80, 190);
  float y2= random (5, 200);
  image (apple, x2, y2, a2, a2);

  float a3 = random (40, 50);
  float x3= random (45, 450);
  float y3= random (150, 300);
  image (apple, x3, y3, a3, a3);


  float a4 = random (10, 30);
  float x4= random (45, 350);
  float y4= random (4, 500);
  image (apple, x4, y4, a4, a4);

  float a5 = random (5, 10);
  float x5= random (2, 300);
  float y5= random (1, 600);
  image (apple, x5, y5, a5, a5);

  float a7 = random (10, 71);
  float x7= random (45, 350);
  float y7= random (4, 500);
  image (apple, x7, y7, a7, a7);

  float a6 = random (10, 30);
  float x6= random (45, 350);
  float y6= random (4, 500);
  image (apple, x6, y6, a6, a6);

  float a8 = random (5, 70);
  float x8= random (43, 308);
  float y8= random (2, 200);
  image (bapple, x8, y8, a8, a8);

  float a9 = random (7, 40);
  float x9= random (200, 300);
  float y9= random (1, 400);
  image (bapple, x9, y9, a9, a9);

  float dd = random (30, 60);
  float b= random (10, 200);
  float c= random (4, 165);
  image (bapple, b, b, dd, dd);
  
  float dd1 = random (15, 85);
  float b1= random (77, 240);
  float c1= random (16, 144);
  image (bapple, b1, b1, dd1, dd1);
  
  
}


