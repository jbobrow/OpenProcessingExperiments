
//Pat Mooney
//CC Lab Homework 2

int     radius;
float   frequency, position, positionAdder;
float   posOne, posTwo;
float[] ballY;
float[] ballX;

void setup() {
  size(500, 500);
  background(0);
  smooth();
  strokeWeight(5);
  
  ballY = new float[6];
  for (int i = 0; i < 6; i++){
    ballY[i] = random(-250, 250);
  }
  
  
  ballX = new float[6];
  for (int i = 0; i < 6; i++){
  ballX[i] = random(-1500, -250);
  }
  

  radius        = 100;
  frequency     = 400;
  position      = 0;

  positionAdder = (frequency / 44100) * TWO_PI;
}

void draw() {
  noStroke();
  
  //background
  fill(0, 0, 0, 15);
  rect(0, 0, width, height);

  translate(width/2, height/2);
  position += positionAdder;

  // Red Circle
  fill(255, 0, 0);
  stroke(255, 0, 0);
  posOne = oscillationPositive(position);
  ellipse((mouseX - 100), (posOne + (mouseY - 250)), 20, 20);
  noFill();
  bezier(float(mouseX - 100), (posOne + (mouseY - 250)), float(mouseX - 150), (posOne + (mouseY - 250)), float(mouseX - 200), (posOne + (mouseY - 250)), float(mouseX - 250), (mouseY - 250));

  // Green
  fill(0, 255, 0);
  stroke(0, 255, 0);
  posTwo = oscillationNegative(position);
  ellipse((mouseX - 100), (posTwo + (mouseY - 250)), 20, 20);
  noFill();
  bezier(float(mouseX - 100), (posTwo + (mouseY - 250)), float(mouseX - 150), (posTwo + (mouseY - 250)), float(mouseX - 200), (posTwo + (mouseY - 250)), float(mouseX - 250), (mouseY - 250));

  //blue center
  fill(0, 0, 255);
  stroke(0, 0, 255);
  ellipse((mouseX - 250), (mouseY - 250), 20, 20);

  //floating spheres
  fill(255, 255, 255);
  stroke(255, 255, 255);
  ellipse(ballX[0], ballY[0], 3, 3);
  ellipse(ballX[1], ballY[1], 3, 3);
  ellipse(ballX[2], ballY[2], 3, 3);
  ellipse(ballX[3], ballY[3], 3, 3);
  ellipse(ballX[4], ballY[4], 3, 3);
  ellipse(ballX[5], ballY[5], 3, 3);
  
  ballX[0] = ballX[0]+ 3;
  ballX[1] = ballX[1]+ 3;
  ballX[2] = ballX[2]+ 3;
  ballX[3] = ballX[3]+ 3;
  ballX[4] = ballX[4]+ 3;
  ballX[5] = ballX[5]+ 3;
  
  if(ballX[0] > 250){ballX[0] = random(-1500, -250);}
  if(ballX[1] > 250){ballX[1] = random(-1500, -250);}
  if(ballX[2] > 250){ballX[2] = random(-1500, -250);}
  if(ballX[3] > 250){ballX[3] = random(-1500, -250);}
  if(ballX[4] > 250){ballX[4] = random(-1500, -250);}
  if(ballX[5] > 250){ballX[5] = random(-1500, -250);}

}


float oscillationPositive(float position) {

  float pos = sin(position);
  pos = pos * radius;
  while (position > TWO_PI) { position -= TWO_PI; }
  return pos;
}

float oscillationNegative(float position) {

  float pos = sin(position-PI);
  pos = pos * radius;
  
  while (position > TWO_PI) { position -= TWO_PI; }
  
  return pos;
}
