
PImage bg;
PImage myblue;
PImage mygreen;
PImage myclear;

float angle = 0.0;

void setup() {
  size(800, 400);
  bg = loadImage("bg.jpg");
  myblue = loadImage("blue.jpg");
  mygreen = loadImage("green.jpg");
  myclear = loadImage("clear.png", "png");
}

void draw() {
  
  noTint();
  imageMode(CORNERS);
  background(0);
  float x = cos(angle) * 100;
  float y = sin(angle) * 100;
  float d = 2*cos(angle) * 50;
  float r = 2*sin(angle) * 50;
  float g = cos(angle) * 5;
  float b = cos(angle) * 5;
  float a = cos(angle) * 5;
  //tint(255, 255, 255, 100);
 
  image (bg, 0, 0, 960, 540);
translate(width/2,height/2);

  imageMode(CENTER);
  //x = random(width);
  //y = random(height);
  //d = random(100, 300);
  //r = random(255);
  g = random(255);
  b = random(255);
  a = random(50, 100);
  tint(0, 0, 255, 80 );
   


  image(myblue, Y+100, x+100, 300, 300);
   angle += 0.01;

 // x = random(width);
 // y = random(height);
 // d = random(100, 300);
 // r = random(255);
  g = random(255);
  b = random(255);
  a = random(50, 100);
  tint(0, 255, 0, 50);

  image(mygreen, X-100, y-100, 300, 300);

 // x = random(width);
 // y = random(height);
 // d = random(100, 300);
 // r = random(255);
  g = random(255);
  b = random(255);
  a = random(50, 100);
  tint(255,0 , 0, 50);
  image(myclear, d, r, 300, 300);
  
  tint(0,0 , 255, 50);
  image(myclear, r, d, 300, 300);
  
  tint(0,255 , 255, 80);
  image(myclear, x*3, y*2, 150, 300);
  
  
}


