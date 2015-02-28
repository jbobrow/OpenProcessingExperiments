

PImage bg;
PImage bg2;
PImage imgR;
PImage imgup;
PImage imgdn;

PFont f;

String chars = "absence and presence  ..  mingled as red earth and pouring rain";

float pointillize;
float soFar = 0;
float speed = .2;

int a; 
int num = 2000;
int range = 6;

int smallPoint = 2;
int largePoint;
int top, left;

float[] ax = new float[num];
float[] ay = new float[num]; 


void setup() { 
  size(798,600);
  frameRate(540);
  
  bg = loadImage ("aqua_air8_399600.jpg");
  bg2 = loadImage ("aqua_air9_399600.jpg");
  imgR = loadImage("aqua_air7_399600.jpg");
  imgup = loadImage("aqua_air6_399600.jpg");
  imgdn = loadImage("aqua_air5_399600.jpg");
  
  image (bg, 0, 0);
  image (bg2, 399, 0);
  
  f = loadFont("SunshineInMySoul-20.vlw");
  smooth();
  
  textFont (f);
  text (chars, 70, 50);
  
  largePoint = min(width, height) / 10;
  // center the image on the screen
  left = (width - imgup.width) / 2;
  top = (height - imgup.height) / 2;
  
  for(int i = 0; i < num; i++) {
    ax[i] = width/2;
    ay[i] = height/2;
  }
  
}

void draw() { 
  // Pick a random point 
  int x = int(random(imgup.width)); 
  int y = int(random(imgup.height)); 
  int loc = x + y*imgup.width;

// Look up the RGB color in the source image 
  loadPixels(); 
  float r = red(imgup.pixels[loc]); 
  float g = green(imgup.pixels[loc]);
  float b = blue(imgup.pixels[loc]); 
  noStroke();

/*
// Draw an ellipse at that location with that color
  fill(r,g,b,100);
  pointillize = random(5, 10);
  ellipse(x,y,pointillize,pointillize);
*/ 
  
  noStroke();
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);

  color pix = imgup.get(x, y);
  fill(r,g,b,100);
  pointillize = random(5, 10);
  ellipse(x, y, pointillize, pointillize);

}

//noLoop and redraw

