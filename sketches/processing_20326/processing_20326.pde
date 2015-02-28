
  int blueColor = 25;

void setup() {
  size (1200,600);
  colorMode(HSB, 360, 100, 100);
  background (25);
  smooth();  
}

void draw() {

/////VARIABLES
  //circleOne
  int circleOneX = mouseX;
  int circleOneY = mouseY;
  circleOneX += random(30,125);
  circleOneY += random(30,125);
  
  //circleTwo
  int circleTwoX = mouseX;
  int circleTwoY = mouseY;
  circleTwoX -= random(30,125);
  circleTwoY -= random(30,125);
  
  //circleThree
  int circleThreeX = mouseX;
  int circleThreeY = mouseY;
  circleThreeX += random(30,125);
  circleThreeY -= random(30,125);
  
  //circleFour
  int circleFourX = mouseX;
  int circleFourY = mouseY;
  circleFourX -= random(30,125);
  circleFourY += random(30,125);
  

  
/////LINES
  stroke (215, 99, blueColor);
  
  //lines center out
  line(mouseX,mouseY,circleOneX,circleOneY);
  line(mouseX,mouseY,circleTwoX,circleTwoY);
  line(mouseX,mouseY,circleThreeX,circleThreeY);
  line(mouseX,mouseY,circleFourX,circleFourY);
  
  //lines between
  line(circleOneX,circleOneY,circleFourX,circleFourY);
  line(circleFourX,circleFourY,circleTwoX,circleTwoY);
  line(circleTwoX,circleTwoY,circleThreeX,circleThreeY);
  line(circleThreeX,circleThreeY,circleOneX,circleOneY);
  
/////CIRCLES
  //Outer Circle
  fill(25);
  stroke (215, 99, blueColor);
  ellipse(mouseX, mouseY, 23, 23);
  ellipse(circleOneX, circleOneY, 23, 23);
  ellipse(circleTwoX, circleTwoY, 23, 23);
  ellipse(circleThreeX, circleThreeY, 23, 23);
  ellipse(circleFourX, circleFourY, 23, 23);
  
  //Center Circle
  noStroke();
  fill (215, 99, blueColor);
  ellipse(mouseX,mouseY, 16, 16);
  ellipse(circleOneX, circleOneY, 16, 16);
  ellipse(circleTwoX, circleTwoY, 16, 16);
  ellipse(circleThreeX, circleThreeY, 16, 16);
  ellipse(circleFourX, circleFourY, 16, 16);

  noLoop();
}

void mousePressed() {
    blueColor += 1;
  redraw();
}

void keyPressed() {
 save("offf.tif"); 
}


