
PFont WQY10;

int numBalls = 25600;
int maxBalls = numBalls;
int fps;
boolean clearBG, doSmooth;
int shapeType;
float maxVelocity = 16, minAccel = 0.8, maxAccel = 1.8;

Seeker[] ball = new Seeker[numBalls];

void setup(){
  size(640,480);
  colorMode(HSB, 255);
  noStroke();
  WQY10 = loadFont("WenQuanYiMicroHei-10.vlw");
  textFont(WQY10);
  clearBG = true;
  doSmooth = false;
  shapeType = 0;
  
  for(int i=0; i<numBalls; i++){
    ball[i] = new Seeker(new PVector(random(width), random(height)));
  }
  
  // numBalls adjusted to a sane default for web distribution
  numBalls = 400;
}

void draw(){
  if(clearBG){
    background(#111421);
  }
 
  rectMode(CENTER);
  for(int i=0; i<numBalls; i++){
    ball[i].seek(new PVector(mouseX, mouseY));
    ball[i].render();
  }
  
  statusWindow();

}

void statusWindow(){
  fill(50, 150);
  rectMode(CORNER);
  rect(5, 5, 140, 150);
  fill(0, 160, 255);
  text ((int)frameRate + " FPS", 15, 30);
  if (shapeType == 0){
    text ("(t) squares", 15, 45);
  }
  else{
    text ("(t) dots", 15, 45);
  }

  if (clearBG){
    text ("(p) clear BG", 15, 60);
  }
  else{
    text ("(p) paint BG", 15, 60);
  }

  if (doSmooth){
    text ("(o) smooth", 15, 75);
  }
  else{
    text ("(o) no smooth", 15, 75);
  }

  text("(z/a) Max velocity: " + nf(maxVelocity, 1, 1), 15, 90);
  text("(x/s) Min acceleration: " + nf(minAccel, 1, 2), 15, 105);
  text("(c/d) Max acceleration: " + nf(maxAccel, 1, 2), 15, 120);
  text("(v/f) Number of specks: " + numBalls, 15, 135);
}

void keyPressed() {
  if (key == 'p' || key == 'P') {
    clearBG = !clearBG;
  }
  if (key == 't' || key == 'T') {
    shapeType = 1-shapeType;
  }
  if (key == 'o' || key == 'O') {
    doSmooth = !doSmooth;
    if (doSmooth){
      smooth();
    }
    else{
      noSmooth();
    } 
  }
  if ((key == 'z' || key == 'Z') && maxVelocity > 1) {
    maxVelocity--;
  }
  if (key == 'a' || key == 'A') {
    maxVelocity++;
  }
  if ((key == 'x' || key == 'X') && minAccel > 0) {
    minAccel-=.05;
  }
  if (key == 's' || key == 'S') {
    minAccel+=.05;
    minAccel = min(minAccel, maxAccel);
  } 
  if (key == 'c' || key == 'C') {
    maxAccel-=0.05;
    maxAccel = max(minAccel, maxAccel);
  }
  if (key == 'd' || key == 'D') {
    maxAccel+=0.05;
  }
  if ((key == 'v' || key == 'V')) {
    numBalls-=50;
    numBalls = max(0, numBalls);
  }
  if (key == 'f' || key == 'F') {
    numBalls+=50;
    numBalls = min(maxBalls, numBalls);
  }
}

