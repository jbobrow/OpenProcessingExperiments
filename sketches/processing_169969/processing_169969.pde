
//hour(); second(); minute(); millis();

float lastTime;
float coolDown = 1000;
boolean isBlack = false;
boolean isRed = true;
int colorChange =  1;


void setup() {
  smooth();
  size(960, 960);
  
}

void draw() { 
  background(second(), minute(), hour());
  pushMatrix(); // referenced from http://forum.processing.org/one/topic/rotate-triangle-around-own-axis.html
  if (isBlack) {
    fill(255, 0, 0);
  } else {
    fill(150, 151, 150);
  }
  // referenced from http://forum.processing.org/one/topic/rotate-triangle-around-own-axis.html
  translate(width/2,height/2);
  rotate(hour()*radians(15));
  triangle(-400, 250, 0, -450, 400, 250);
  popMatrix();
  // until here.
  
  if (isBlack) {
    fill(255, 0, 0);
  } else {
    fill(150, 151, 150);
  }
  
  
  if (isBlack) {
    fill(254, 254, 254);
  } else {
    fill(254, 0, 0);
  }
  ellipse(width/2, height/2, (minute())+ 100, (minute())+ 100);
  if (isBlack) {
    fill(0);
  } else {
    fill(255);
  }
  noStroke();
  ellipse(width/2, height/2, 100, 100);
  if (millis() > lastTime + coolDown) {
    isBlack = !isBlack; 

    lastTime = millis();
  }
}

