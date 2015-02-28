
int lastX = 0;
int lastY = 0;
int screenCenter = 300;
float pixelsOfVariation;
int heightChangePerMinute = 10;
float tilt = 0;
int tiltDirection = 0;
int nextHour = 0;
boolean drawnEverythingButCurrent = false;
color stemColor = 0;

void setup() {
  size(600,600);
  strokeWeight(4);
}

void draw() {
  background(0);
  for(int h=0; h<hour(); h++) {
      stemColor = color(random(64,138),random(34,69),0);
      stemDrawHour(h, 60, second());
  }
  stemDrawHour(hour(),minute(), second());
}


void stemDrawHour(int hourToDraw, int minToDraw, int secToDraw) {
  if(hourToDraw == hour()) stemColor = color(random(50,100),random(100,150),0);
  // Restart the tilt variable so that it is not affected by previous values.
  tilt = 0;
  if(hourToDraw%2 == 0){ 
    lastX = hourToDraw*6;
    tiltDirection = 1;
  }
  else {
    lastX = -hourToDraw*6;
    tiltDirection = -1;
  }
  lastY = 600;
  for(int x = 1; x <= minToDraw; x++) {
    stroke(stemColor);
    pixelsOfVariation = calculatePix(x,hourToDraw);
    // Bottom of tree tilt
    if(x<10) {
      tilt=(-0.4)*hourToDraw*(tiltDirection);
    }
    // Until Middle of tree tilt
    else if(x == 10) tilt=tiltDirection;
    // Middle of tree and up tilt
    if(x>30) {
      tilt=(0.2)*hourToDraw*tiltDirection;
    }
    strokeWeight(6);
    line(screenCenter+lastX, lastY, screenCenter+lastX+pixelsOfVariation+(tilt), (int)lastY-heightChangePerMinute);
    lastX += pixelsOfVariation+(tilt);
    lastY -= heightChangePerMinute;
    // Draw the leafs or part of trunk depending on the fill at that point.
    for(int l = 0; l<secToDraw;l++) {
      fill(random(105-180,168-180)+3*x,random(143-180,230-180)+3*x,random(0,10)+(x/3));
      noStroke();
      drawLeaf(screenCenter+lastX+random(-10,10),lastY+heightChangePerMinute+random(-10,10));
    }
  }
}

float calculatePix(int m, int h) {
  float numberToMod = (m+h);
  numberToMod = numberToMod%10;
  if (numberToMod%3 == 0) numberToMod*=-1;
  if (numberToMod%2 == 0) numberToMod*=(-1);
  return numberToMod;
}

void drawLeaf(float x, float y) {
  quad(x,y,x+1,y+1,x,y+2,x-1,y+1); 
}


