
/*
 Animation Week 6
 
 Sumission Date: 12/10/11
 Authors: Stephen Macvean & Ian Westwater
 */

// Global Variable decleration.
PImage rocket = new PImage();
PImage sky = new PImage();
PImage bg2 = new PImage();
float x;
float y;
float a;
float b;
int pass;
int flying;
int counter=0;
PFont f;

void setup() {
  // setup Canvas
  size(600, 600);
  background(255);
  smooth();
  frameRate(20);

  // set runtime parameters
  //noLoop();

  //initialise gloabl variables
  x = width/2;
  y = height-100;
  a = 0;
  b = -600;
  pass=0;
  rocket = new PImage();
  f = createFont("Arial",12,true);
  textFont(f);

  // load images and resize if neccesary
  rocket = loadImage("rocket.gif");
  rocket.resize(0, 100);
  image(rocket, x, y);
  
  sky = loadImage("sky_grad.png");
  bg2 = loadImage("skySpace.png");
  
  // will need to include push matrix to manipulate when background is being drawn
  //pushMatrix();
}

void draw(){
  if (pass < 50){
    shake();
  } else{
    fly();
  }
  
}

void shake() {
    // redraw background
    PImage b;
    b = loadImage("sky_grad.png");
    background(b);
    
    if (pass % 2 == 1){
      x -= 5;
    } else if (pass % 2 == 0){
      x += 5;
    }
    
    print (pass);
    image(rocket, x, y);
    pass++;
}

//When shaking has begun, fly rocket to y=300
void fly() {
  if (y>= 300)
  {
    background (sky);
    y-=5;  
  } else{
    bgMove();   
  }
  
  image(rocket, x, y);
}

//When rocket reaches y=300 on the sketch, begin background scrolling
void bgMove() {
  if (b<=-0){
    b+=5;
    image(rocket, width/2, 295);
  } else{
    image(bg2, a, 0);
    y-=5;  
    image(rocket, x, y);    
  }
  
  image(bg2, a, b); 
}

