
float[] timing = {
  1, 3, 2, 2, 4
};
String[] names = {
  "intro",
  "topic 1\n(and diversion)",
  "topic 2",
  "topic3\n(another diversion)",
  "conclusion"
};

float minuteWidth = 128;
float minutesPerMillis = 1 / (60 * 1000.);
float manualOffset = 0;

PFont font;
void setup() {
  size(512, 128);
  font = createFont("Helvetica", 24);
  textFont(font);
}

void drawBlocks() {
  pushMatrix();
  for(int i = 0; i < timing.length; i++) {
    stroke(0);
    fill(255);
    
    float curWidth = timing[i] * minuteWidth;
    rect(0, 0, curWidth, height);
    
    noStroke();
    fill(0);
    text(names[i], 10, height / 2);
    translate(curWidth, 0);
  }
  popMatrix();
}

void draw() {
  background(0);
  
  translate(width / 2, 0);
  strokeWeight(1);
  
  pushMatrix();
  float offset = (millis() * minutesPerMillis + manualOffset) * minuteWidth;
  translate((int) -offset, 0);
  drawBlocks();
  popMatrix();
  
  strokeWeight(2);
  stroke(255, 0, 0);
  line(0, 0, 0, height);
}

void mouseDragged() {
  float totalTime = 0;
  for(int i = 0; i < timing.length; i++) {
    totalTime += timing[i];
  }
  manualOffset = totalTime * mouseX / width;
}

