
// rotateBomb
// By : Colin Thompson
// Made : Oct 4th, 2009
// Where : Processing workshop @ Gray Area Foundation For The Arts, San Francisco, CA

int w = 500;
int h = w;
float hw = w/2;
float hh = h/2;
int minS = 10;
int maxS = 80;
float rotation = 0;
int first = 1;
color[] colors = {
  color(0,0,49),
  color(150,0,240),
  color(0,74,255),
  color(100,174,255),
  color(0,174,255),
  color(0,32,40),
  color(255,0,100),  
  color(52,204,240)}; 
int blurOn = 0;  
PImage currImg;
void setup() {
  size(w,h,P2D);
  background(0);
  frameRate(30);
  //smooth();

}
int time = 0;
void draw() {
  if (keyPressed) {
    if (key == 'b') {
      blurOn = 1 - blurOn;
    }
  }
  float posX = random(0,w);
  float posY = random(0,h);
  noStroke();
  fill(255);
  rotation = sin((PI * noise(time*.5)*2)-.5);
  rotation = 1;
  rotation %= 360;
  int randN = int(random(10,40));
  float s = random(minS,maxS);
  pushMatrix();
  translate(posX,posY);
  for (int i = 0; i < randN; i++) {
    fill(colors[int(random(0,7))]);
    rotate(HALF_PI*i);
    translate(random(10,50),random(10,50));
    s = s * .8;
    ellipse(0,0,s,s);     
  }
  popMatrix();
  currImg = get(0,0,w,h);
  if (blurOn == 1) {
    currImg.filter(BLUR,1);
  }
  imageMode(CENTER);
  translate(hw,hh);
  rotate(radians(rotation));
  image(currImg,0,0);
  if (first == 1) {
    blend(currImg, 0, 0, w, h, 0, 0, w, h, LIGHTEST);
  }
  if (key == 'q') {
    blend(currImg, 0, 0, w, h, 0, 0, w, h, DIFFERENCE);
    first = 0;
  } 
  else if (key == 'w') {
    blend(currImg, 0, 0, w, h, 0, 0, w, h, SCREEN);
    first = 0;
  } 
  else if (key == 'e') {
    blend(currImg, 0, 0, w, h, 0, 0, w, h, LIGHTEST);
    first = 0;
  } 
  else if (key == 'r') {
    blend(currImg, 0, 0, w, h, 0, 0, w, h, DODGE);
    first = 0;
  }    
  else if (key == 't') {
    blend(currImg, 0, 0, w, h, 0, 0, w, h, EXCLUSION);
    first = 0;
  }    
  else if (key == 'y') {
    if (keyPressed) {
      background(0);
    }
  }    
  time++;
}
















