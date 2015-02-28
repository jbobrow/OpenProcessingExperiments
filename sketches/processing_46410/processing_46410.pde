
PImage cloud;
PImage cloud1;
PImage cloud2;
PImage cloud3;
PImage cloud4; 
PImage bg;
PImage sky2;
PImage eyes1;
PImage eyes2;
PImage eyes3;

float a = 0;
float b = 0;
float c = 0;
float d = 0;
float e = 0;

void setup() {
  size(500, 350);
  cloud = loadImage("cloud.png");
  cloud1 = loadImage("cloud1.png");
  cloud2 = loadImage("cloud2.png");
  cloud3 = loadImage("cloud3.png");
  cloud4 = loadImage("cloud4.png");
  bg = loadImage("sky.jpg");
  sky2 = loadImage("sky2.jpg");
  eyes1 = loadImage("eyes1.png");
  eyes2 = loadImage("eyes2.png");
  eyes3 = loadImage("eyes3.png");
}

void draw () {
  tint(255,255,255);
  background(255,255,255);
  image(bg,0,0,500,350);
  
  tint(255,255,255,mouseX);
  image(sky2,0,0,500,350);
  
  if (mousePressed) {
  tint(255,255,255,mouseY);
  image(eyes3,0,117,500,116);
} else {
  tint(255,255,255,mouseY);
  image(eyes1,0,117,500,116);
}
  

  
  a = a - 1;
  if (a < -200) {
    a = height;
  }
  tint(mouseX, mouseX, mouseX);
  image(cloud,50,a,200,200);
  

  
  b = b - 1;
  if (b < -100) {
    b = height;
  }
  image (cloud1, 200, b, 300,300) ;
  
  c = c - .8;
  if (c < -200) {
    c = height; 
  }
  image (cloud2, 100, c, 250, 250);
  
  d = d - 0.75;
  if (d < -200) {
    d = height;
  }
  image (cloud3, -100, d, 300, 300);
  
  e = e - 1.2;
  if (e<-200) {
    e = height;
  }
  image (cloud4, 350, e, 275,275);
  




}

