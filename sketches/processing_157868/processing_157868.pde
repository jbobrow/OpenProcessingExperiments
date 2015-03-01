
int startLoop = 0;
float d = 20.0;



void setup() {
  size(500,500);
  newStart();
}


void newStart() {
  d = 20.0;
  startLoop= millis();
}


void draw() {
  background(255);
  if (millis() < startLoop+2500) {
    d++;
    smooth();
    noStroke();
      fill(255,0,0);
    ellipse(width/2,height/2,d,d);
  } 
  else {
    newStart();
  }
}

