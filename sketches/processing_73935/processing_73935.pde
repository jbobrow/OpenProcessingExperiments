
float[] starpos = new float[48*2];
int mils;
int prevSec;
int millisRolloverTime;

void setup() {
  size(500, 500);
  smooth();
  int millisRolloverTime = 0; 
  for(int i = 0; i < 48*2; i+=2) {
    starpos[i] = random(100, 400);
    starpos[i+1] = random(100, 400);
  }
}

void draw() {
  background(0);
  int H = hour();
  int M = minute();
  int S = second();
  
  if (prevSec != S){
    millisRolloverTime = millis();
  } 
  prevSec = S;
  mils = millis() - millisRolloverTime;
  for(int i = 0; i < hour(); i++){
    drawStar(starpos[i], starpos[i+1]);
  }
  if (minute() < 30){
    drawEarth();
    drawSun();
  }
  else {
    drawSun();
    drawEarth();
  }

}

void drawEarth() {
  float xmap = map(minute(), 0, 59, 300, 0); 
  float ymap = map(minute(), 0, 59, 300, 0);
  float x = xmap * cos(mils*0.0065);
  float y = ymap * sin(mils*0.0065);
  fill(0, 0, 255);
  ellipse(x + width/2, y + height/2, 50+minute(), 50+minute());
  fill(0, 255, 0);
 
}

void drawSun() {
  float c = map(minute(), 0, 59, 0, 255);
  float xmap = map(minute(), 0, 59, 0, 50); 
  float ymap = map(minute(), 0, 59, 0, 50);
  float x = xmap * cos(mils*0.0065);
  float y = ymap * sin(mils*0.0065);
  fill(225, 255, c);
  ellipse(x + width/2, y + height/2, 100-minute(), 100-minute());
}

void drawStar(float x, float y) {
  float animate = 5*sin(frameCount*0.1);
  noStroke();
  fill(255, 255, 255);
  beginShape();
  vertex(x, y -20- animate);
  bezierVertex(x, y, x, y, x - 20 - animate, y);
  bezierVertex(x, y, x, y, x, y + 20+ animate);
  bezierVertex(x, y, x, y, x + 20+ animate, y);
  bezierVertex(x, y, x, y, x, y - 20+ animate);
  endShape();  
}
