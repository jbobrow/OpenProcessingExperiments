
int emptybarWidth=200;
int emptybarHeight=20;
String done = "DONE! CLICK TO RESET";
int loadPercent = 101;
int numFrames = 0;

void setup() {
  size(300,300);
  stroke(255);
  smooth();
  frameRate(60);
}
void draw() {
  background(0);
  if (loadPercent > 100) {
    textAlign(CENTER);
    text(done, width/2, height/2);
    numFrames = 0;
  }
  else {
    fill(0);
    rect(50, height/2, emptybarWidth, emptybarHeight);
    numFrames++;
    if (numFrames % 3 == 0) {
      loadPercent++;
    }
    fill(255);
    text("LOADING " + loadPercent + "%", 90, height/2 - 5);
    rect(50, height/2,loadPercent*2, emptybarHeight);
  }
}

void mousePressed() {
  numFrames = 0;
  loadPercent = 0;
}

                
                
