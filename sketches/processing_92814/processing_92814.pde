
void setup() {
  size(1000, 1000);
  smooth();
  noStroke();
}

int XofMouse;
int YofMouse;

void draw() {
  background(230, 250, 216);

  //face
  fill(255, 247, 201);
  ellipse(500, 500, 800, 800);

  //eyebackground
  fill(138, 103, 78);
  arc(330, 380, 190, 300, PI, TWO_PI);
  arc(670, 380, 190, 300, PI, TWO_PI);

  //iris
  fill(71, 53, 40);
  arc(330, 380, 190/2.4, 300/2.4, PI, TWO_PI);
  arc(670, 380, 190/2.4, 300/2.4, PI, TWO_PI);

  //XofMouse = mouseX;
  //YofMouse = mouseY;

  //mouth
  fill(245, 102, 195, 100);
  //if(150 < XofMouse < 850) {
  //  rect(345,645,310,mouseY);
  // }
  // else if(150 < mouseY < 850) {
  //   rect(345,645,310,160);
  // }
  // rect(345, 645, 310, 0.16*mouseY+10);

  rect(345, 645, 310, 0.16*mouseY+10);

  //eyelid
  fill(112, 93, 89);
  arc(330, 230+0.15*mouseX, 190, 300, PI, TWO_PI);
  arc(670, 230+0.15*mouseX, 190, 300, PI, TWO_PI);
}
