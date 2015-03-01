
int xPos = 10;
int xWidth = 10;
int beatLineWidth = 1;
boolean ableToExpand = true;
float markerSpeed = 5;
int selectionPos = 0;
float bgHue = 0;
void setup() {
  size(300, 300);
  colorMode(HSB, 100);
}
void draw () {
  background(bgHue,100,50);
  moveSquare();
  beatLine();
  timingDetection();
  accuracy();
  stroke(100);
  strokeWeight(beatLineWidth);
  line(width/2, 0, width/2, height);
}
void moveSquare() {
  noStroke();
  rect(xPos, 20, xWidth, 10);
  if (xPos<width) {
    xPos+=markerSpeed;
  }
  else {
    xPos=-xWidth;
    ableToExpand = true;
    markerSpeed=random(5.0)+1;
    fill(100,100);
  }
}
void timingDetection() {
  if (keyPressed) {
    fill(100,0);
    selectionPos = xPos;
  }
}
void beatLine() {
  if (ableToExpand && xPos >= width/2-xWidth) {
    beatLineWidth=10;
  }
  if (beatLineWidth>1) {
    ableToExpand = false;
    beatLineWidth-=1;
  }
}
void accuracy (){
  bgHue = map(abs(width/2-selectionPos),0,width/2,30,0);
  println(bgHue);
}
