
float updatePercent;
float fillPercent;
boolean mouseClickOn;
String loadingText;
int loadNum;

void setup() {
  size(300, 300); 
  background(0);
}

void draw() {
  background(0);
  stroke(255);
  fill(0);
  rect(width/2-100, height/2-10, 200, 20);
  updatePercent(0.005);
  loadingText = "Loading " + loadNum + "%" ;
}

void updatePercent(float rate) {
  loadingText = "Loading " + loadNum + "%" ;

  fill(255);
  if(fillPercent >= 1) {
    mouseClickOn = true;
    rect(width/2-100, height/2-10, 200, 20);
    loadNum = 100;
    text(loadingText, width/2-100, height/2-20);
  }
  else {
    float progressWidth = 200 * fillPercent;
    fillPercent += rate; 
    rect(width/2-100, height/2-10, progressWidth, 20);
    loadNum = int(100 * fillPercent);
    text(loadingText, width/2-100, height/2-20);

  }
}

void mouseClicked() {
  if(mouseClickOn) {
    mouseClickOn = false;
    fillPercent = 0; 
  }
}

