
//MY WALLPAPER CREATOR -- EMMA TAYLOR//

int blueColor = 25;

void setup() {
  size (400,800);
  PImage bg;
  bg =loadImage("background.jpg");
  background (bg);
  smooth(); 
}

void draw() {
 
/////VARIABLES
  //circleOne
  int circleOneX = mouseX;
  int circleOneY = mouseY;
  circleOneX += random(10,200);
  circleOneY += random(30,300);
   
  //circleTwo
  int circleTwoX = mouseX;
  int circleTwoY = mouseY;
  circleTwoX -= random(30,125);
  circleTwoY -= random(90,50);
   
  //circleThree
  int circleThreeX = mouseX;
  int circleThreeY = mouseY;
  circleThreeX += random(60,100);
  circleThreeY -= random(30,200);
   
  //circleFour
  int circleFourX = mouseX;
  int circleFourY = mouseY;
  circleFourX -= random(30,150);
  circleFourY += random(170,300);
   
 
   
/////LINES
  stroke (#264C6C, blueColor);
   
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

   
  //Center Circle
  noStroke();
  fill (#5FB6FF, blueColor);
  ellipse(mouseX,mouseY, 5, 5);
  ellipse(circleOneX, circleOneY, 5, 5);
  ellipse(circleTwoX, circleTwoY, 5, 5);
  ellipse(circleThreeX, circleThreeY, 5, 5);
  ellipse(circleFourX, circleFourY, 5, 5);
 
  noLoop();
}
 
void mousePressed() {
    blueColor += 1;
  redraw();
}
 
 void keyPressed() {
 save("wallpaper.png");
}







