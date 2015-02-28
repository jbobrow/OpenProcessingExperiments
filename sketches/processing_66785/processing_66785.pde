
int startTime;
int currentTime;
int intervalTime;
int heightr;
boolean isbigger;

void setup() {
  background(0);
  size(500, 500);
  smooth();
  heightr = 0;
  startTime = millis();
  intervalTime = 5000;
  isbigger = false;
}

void draw() {
  currentTime = millis();
  if (currentTime - startTime>=intervalTime) {
    startTime = millis();
    isbigger=true;
  }

  if (isbigger==true) {
    heightr=heightr+5;
    fill(0);
    noStroke();
    rect(0, 0, width, heightr);
  }

  if (heightr>=500) {
    isbigger=false;
    heightr=0;
  }   
  strokeWeight(random(5, 100));
}

void mouseDragged() {

  stroke(255, random(255), random(255),random(255));
  line(mouseX, mouseY, pmouseX, pmouseY);
}


