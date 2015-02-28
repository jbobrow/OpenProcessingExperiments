
void setup(){
  size(800,550);
  frameRate(1);
  noLoop();
}

int value = 0;

void draw() {
  background(102,153,153);
  smooth();
  fill(value);
  strokeWeight(120);
  stroke(51,204,204);
  line(0,0,800,550);
  strokeWeight(60);
  stroke(204,255,255);
  line(0,0,800,550);
}

void mouseClicked() {
  if(value == 0) {
    strokeWeight(13);
    stroke(255,0,204);
    line(0, 350, 800, 350);
    line(50, 0, 550, 550);
    line(275, 0, 490, 550);
    line(340, 0, 275, 550);
    line(560, 0, 200, 550);
    line(0, 100, 930, 550);
    line(0, 400, 800, 150);
    stroke(255,0,0);
    line(0, 300, 800, 300);
    line(15, 0, 515, 550);
    line(250, 0, 450, 550);
    line(315, 0, 250, 550);
    line(535, 0, 175, 550);
    line(0, 75, 905, 550);
    line(0, 375, 800, 125);
    stroke(255,102,0);
    line(0, 250, 800, 250);
    line(-10, 0, 490, 550);
    line(225, 0, 425, 550);
    line(290, 0, 225, 550);
    line(510, 0, 150, 550);
    line(0, 50, 880, 550);
    line(0, 350, 800, 100);
    stroke(255,255,0);
    line(0, 225, 800, 225);
    line(-35, 0, 465, 550);
    line(200, 0, 400, 550);
    line(265, 0, 200, 550);
    line(585, 0, 125, 550);
    line(0, 25, 880, 525);
    line(0, 325, 800, 75);
    loop();
  } else {
    value = 0;
  }
}



