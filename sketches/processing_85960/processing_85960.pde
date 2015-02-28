
float[] numbersX = new float[10];
float[] numbersY = new float[10];
float centreY2; 
float centreX2;
float centreX=300;
float d;
float times=-100;
float centreY=200;
void setup() {
  size(400, 400);
  noFill();
  strokeWeight(7);
  smooth();
}
void draw() {
fill(0, 12);
  rect(0, 0, width-2, height-2);
  d+=0.14;
  if (mousePressed) {
  stroke(mouseX/2+50);
  }
  else {
  stroke(abs(((mouseX*2)*-1)+width)+10,80,abs(((mouseY*2)*-1)+width));
  }
      numbersX[0] = (sin(d) * -25)+centreX;
  numbersX[1] = centreX;
  numbersX[2] = centreX + sin(d)*25;
  numbersY[0] = (cos(d) * -25)+centreY;
  numbersY[1] = centreY;
  numbersY[2] = centreY + cos(d)*25;
    numbersX[3] = (sin(d*-1) * -25)+centreX;
  numbersX[4] = centreX + sin(d*-1)*25;
  numbersY[3] = (cos(d*-1) * -25)+centreY;
  numbersY[4] = centreY + cos(d*-1)*25;
        numbersX[5] = (sin(d) * -25)+centreX2;
  numbersX[6] = centreX2;
  numbersX[7] = centreX2 + sin(d)*25;
  numbersY[5] = (cos(d) * -25)+centreY2;
  numbersY[6] = centreY2;
  numbersY[7] = centreY2 + cos(d)*25;
    numbersX[8] = (sin(d*-1) * -25)+centreX2;
  numbersX[9] = centreX2 + sin(d*-1)*25;
  numbersY[8] = (cos(d*-1) * -25)+centreY2;
  numbersY[9] = centreY2 + cos(d*-1)*25;
  ellipse(numbersX[6], numbersY[6], 25, 25);
  ellipse(numbersX[5], numbersY[5], 25, 25);
  ellipse(numbersX[7], numbersY[7], 25, 25);
  ellipse(numbersX[9], numbersY[9], 25, 25);
  ellipse(numbersX[8], numbersY[8], 25, 25);
    ellipse(numbersX[1], numbersY[1], 25, 25);
  ellipse(numbersX[0], numbersY[0], 25, 25);
  ellipse(numbersX[2], numbersY[2], 25, 25);
  ellipse(numbersX[4], numbersY[4], 25, 25);
  ellipse(numbersX[3], numbersY[3], 25, 25);
  centreX = mouseX+sin(d)*50;
  centreY = mouseY+cos(d)*50;
  centreX2 = mouseX+sin(d-PI)*50;
  centreY2 = mouseY+cos(d-PI)*50;
  ellipse(mouseX ,mouseY, 25, 25);
}
