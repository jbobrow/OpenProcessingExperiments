
int canvasSize = 600;

void setup(){
  size(canvasSize, canvasSize);
  smooth();
  background(0);
  colorMode(HSB);
  strokeWeight(5);
}

int it = 0;
float noiseInc = 0.01;
float x = 0, y = 0;
float xend = 0, yend = 0;
int segment = 0;
int segmentScale = 30; //20

void draw() {
  fill(0, 5);
  noStroke();
  rect(0, 0, canvasSize, canvasSize);
  if (xend > canvasSize || yend > canvasSize) {
    it++;
    xend = 0;
    yend = 0;
    segment = 0;
  }
    x = xend;
    y = yend;
    segment++;
    
    xend += noise(it, segment * noiseInc) * segmentScale;
    yend += noise(segment * noiseInc, it) * segmentScale;
    stroke(it%255, 255, 255);
    // from top left
    line(x, y, xend, yend);
    
    // from bottom left, top right, and bottom right
    line(x, canvasSize - y, xend, canvasSize - yend);
    line(canvasSize - x, y, canvasSize - xend, yend);
    line(canvasSize - x, canvasSize - y, canvasSize - xend, canvasSize - yend);
}


