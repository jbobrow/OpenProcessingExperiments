

PImage heart;

float heartPosX;
float heartPosY;

float tintR;
float tintG;
float tintB;

float heartWidth;
float heartHeight;

void setup() {
  size (600,600);
  background(255);

  heart = loadImage("heart.png");
  
//  heartPosX=0;
//  heartPosY=0;
//  
//  mouseX=0;
//  mouseY=0;
//  
}

void draw () { 
//background(255);
//  rect (width/2, height/2, 100,100);

  
  tintR = map(mouseX, 0, width, 0 , 255);
  tintG = map(mouseY, 0, height, 0, 255);
  tintB = map(frameCount, 0, 300, 0 , 255);
  
  heartWidth = map(mouseX, 0, width, 0, 200);
  heartHeight = map(mouseY, 0, height, 0, 250);
  
  float random1 = random(30);
  float random2 = random(30);
  
  float freq = map(frameCount, 0, 10000, 0.001, 60);
  float scale = map(sin(frameCount * freq), -1, 1, 300, 400);
  
//  size(100,100, P3D);
  textSize(32);
  fill(0);
  text("Listen to your heart", 150, 50, -20);
  text("Listen to your heart", 150, 70);
  
 
  
 translate(width/2, height/2);
 rotate(radians(frameCount * 0.2));
  
//  printIn("random1: " + random1 + "random2: " + random2);
  
  tint(tintR, tintG, tintB);
  imageMode(CORNER);
  imageMode(CENTER);
  
 image(heart, heartPosX, heartPosY, scale, scale);
  
  
  
}


