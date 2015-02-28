
PFont S14;
PImage bg;
int numBalls = 950;
int maxBalls = numBalls;
int fps;
boolean clearBG, doSmooth;
int shapeType;
float maxVelocity = 16, minAccel = 0.6, maxAccel = 2.0;
 
Seeker[] ball = new Seeker[numBalls];
 
void setup(){
  bg = loadImage("back.png");
  size(640,480);
  noStroke();
  S14 = loadFont("S14.vlw");
  textFont(S14);
  clearBG = true;
  doSmooth = false;
  shapeType = 0;
   
  for(int i=0; i<numBalls; i++){
    ball[i] = new Seeker(new PVector(random(width), random(height)));
  }
   
 
  numBalls = 395;
}
 
void draw(){
  if(clearBG){
   background(bg);
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
  fill(200, 20, 100);

 {
    text ("(1) Fill/Clear", 15, 75);
  }
 
  text("(2/3) Smaller/Bigger ", 15, 105);
 
  text("(4/5) NumBalls Less/More ", 15, 135);
}
 
void keyPressed() {
  if (key == '1' || key == '1') {
    clearBG = !clearBG;
  }
  
  if ((key == '2' || key == '2') && maxVelocity > 1) {
    maxVelocity--;
  }
  if (key == '3' || key == '3') {
    maxVelocity++;
  }
  
  if ((key == '4' || key == '4')) {
    numBalls-=50;
    numBalls = max(0, numBalls);
  }
  if (key == '5' || key == '5') {
    numBalls+=50;
    numBalls = min(maxBalls, numBalls);
    
    
    
  }
}
class Seeker{
  PVector position;
  PVector velocity = new PVector(0, 0);
  float accelRate, radius;
  color fillColor;
  float rnd;
     
  public Seeker(PVector pos){
    position = pos;
    rnd = random(1.5);
    fillColor = color((int) (rnd*255), 180, 255);
  }
   
  public void seek(PVector target){
    accelRate = map(rnd, 0, 1, minAccel, maxAccel);
    target.sub(position);
    target.normalize();
    target.mult(accelRate);
    velocity.add(target);
    velocity.limit(maxVelocity);
 
    position.add(velocity);
  }
   
  public void render(){
    fill(fillColor);
    radius = sq(map(velocity.mag(), 0, maxVelocity, 4, 1));
    if(shapeType == 0){
      ellipse(position.x, position.y, radius, radius);
    }
  }
}


