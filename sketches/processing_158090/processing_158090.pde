
int TIME = 2000;
int currentTime;
boolean bRed;

void setup() {
  size(500,500);
  smooth();
  noStroke();
}

void draw() {
  background(255);
  
  if (bRed) {
    fill(255, 0, 0);
  } else {
    fill(0);
  }
  
  ellipse(width/2, height/2, 120, 120);  
  
  if (millis() - currentTime > TIME) {                
    currentTime = millis();
    bRed = !bRed;
  }
  
}

