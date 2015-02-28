
boolean flipFlop = false;
String keyPrompt = "press any key";
float _eyeBallDiam;
float _mouthWidth;

int[] eyeBallDiam = {20,65};
int[] mouthWidth = {15,55};
void setup() {
  size(300, 300);
  background(255, 155, 200);
  translate(150, 150);
}

void draw () {
  if (flipFlop == false) {

    makeFace();
    
  }
}

void makeFace() {
  //head
  translate(150, 150);
  fill(12, 54, 12);
  ellipse(0, 0, 200, 200);
  //eyes
  fill(34, 155, 83);
  ellipse(-70, 0, _eyeBallDiam, 80);
  ellipse(70, 0, _eyeBallDiam, 80);
  //pupile
  fill(255, 0, 192);
  ellipse(-70, 0, 13, 13);
  ellipse(70, 0, 13, 13);
  //mouth
  fill(0, 255, 26);
  ellipse(0, 60, 45, _mouthWidth);
  //hair
  fill(7, 199, 233);
  rect(-10, -150, 20, 100);
}

void keyPressed(){
  _eyeBallDiam = random(eyeBallDiam[0], eyeBallDiam[1]);
  _mouthWidth = random(mouthWidth[0], mouthWidth[1]);
  
}

