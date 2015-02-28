
  //original code by Kimber Couzo
  //edited by Dianna Xu
  
  int blueColor = 25;
 
void setup() {
  size (700,400);
  colorMode(HSB, 355, random(100), random(100));
  background (5);
  smooth(); 
}
 
void draw() {
 
/////VARIABLES
  //circleOne
  int circleOneX = mouseX;
  int circleOneY = mouseY;
  circleOneX += random(90,208);
  circleOneY += random(60,125);
   
  //circleTwo
  int circleTwoX = mouseX;
  int circleTwoY = mouseY;
  circleTwoX -= random(30,125);
  circleTwoY -= random(30,190);
   
  //circleThree
  int circleThreeX = mouseX;
  int circleThreeY = mouseY;
  circleThreeX += random(70,180);
  circleThreeY -= random(50,205);
   
  //circleFour
  int circleFourX = mouseX;
  int circleFourY = mouseY;
  circleFourX -= random(30,305);
  circleFourY += random(80,125);
   
 
   
/////LINES
  stroke (205, 99, blueColor);
   
   
  //lines between
  line(circleOneX,circleOneY,circleFourX,circleFourY);
  line(circleFourX,circleFourY,circleTwoX,circleTwoY);
  line(circleTwoX,circleTwoY,circleThreeX,circleThreeY);
  line(circleThreeX,circleThreeY,circleOneX,circleOneY);
   
/////CIRCLES
  //Outer Circle
  fill(10);
  stroke (215, 99, blueColor);
  ellipse(mouseX, mouseY, random(23), 50);
  ellipse(circleOneX, circleOneY, random(223), 103);
  ellipse(circleTwoX, circleTwoY, random(80), random(150));
  ellipse(circleThreeX, circleThreeY, random(200), random(30));
  ellipse(circleFourX, circleFourY, random(123), 23);
   
  //Center Circle
  noStroke();
  fill (215, 99, blueColor,50);
  ellipse(mouseX,mouseY, random(316), random(216));
  ellipse(circleOneX, circleOneY, random(100), random(16));
  ellipse(circleTwoX, circleTwoY, random(106), random(200));
  ellipse(circleThreeX, circleThreeY, random(50), random(250));
  ellipse(circleFourX, circleFourY, random(26), random(133));
 
  noLoop();
}
 
void mousePressed() {
    blueColor += 1;
  redraw();
}
 
void keyPressed() {
 save("offf.tif");
}
