
//structure 2(173), inputs 1(205), 3(229), 4(237), 5(245)

  float pupilX = map(mouseX, 0, width, 215, 265);
  float pupilY = map(mouseY, 0, height, 200, 240);
  float pupilA = map(mouseX, 0, width, 375, 425);

void setup() {
  size(640, 480);
  noStroke();
  smooth();
}

void draw() {
  background(50);
  fill(255);
  ellipse(240, 225, 80, 80); //left eye
  ellipse(400, 225, 80, 80); //right eye
  fill(0);
  float pupilX = map(mouseX, 0, width, 215, 265);
  float pupilY = map(mouseY, 0, height, 205, 240);
  float pupilA = map(mouseX, 0, width, 375, 425);
  ellipse(pupilX, pupilY, 20, 20); //left pupil
  ellipse(pupilA, pupilY, 20, 20); //right pupil
  
  if (mousePressed == true) {
    if (mouseButton == LEFT) {
      fill(255);
      strokeWeight(5);
      stroke(0);
  ellipse(240, 225, 80, 80); //left eye
  ellipse(400, 225, 80, 80); //right eye
      fill(255);
      stroke(255);
      ellipse(pupilX, pupilY, 20, 20); //left pupil
      ellipse(pupilA, pupilY, 20, 20); //right pupil
    float x = 240;
    float y = 400;
     float offset = random(-10, 10);
     fill(0);
     ellipse(x + offset, 225, 10, 10);
     ellipse(y + offset, 225, 10, 10);
     
     
    }
  } else {
     ellipse(pupilX, pupilY, 20, 20); //left pupil
     ellipse(pupilA, pupilY, 20, 20); //right pupil
  }
  }

 


