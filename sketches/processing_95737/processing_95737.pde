
float leftEyeX = 125;
float leftEyeY = 300;
float rightEyeX = 275;
float rightEyeY = 300;
//pupils
float leftPupilX = 125;
float leftPupilY = 300;
float rightPupilX = 275;
float rightPupilY = 300;
 
 
 
void setup () {
  size (400, 600);
}
 
void draw () {
  strokeWeight(4);
  fill (255, 255, 0);
  ellipse (width/2, height/2, 350, 350);
  line(150, 400, 250, 400);
   
  fill(255, 255, 255);
  strokeWeight(1);
  ellipse (leftEyeX, leftEyeY, 100, 100);
  ellipse (rightEyeX, rightEyeY, 100, 100);
   
  //(where it starts, where it can go(2), where you want it to go(2))
  leftPupilX = map(mouseX, 0, width, leftEyeX-25, leftEyeX+25);
  rightPupilX = map(mouseY, 0, width, rightEyeX-25, rightEyeX+25);
  leftPupilY = map(mouseX, 0, height, leftEyeY-25, leftEyeY+25);
  rightPupilY = map(mouseY, 0, height, rightEyeY-25, rightEyeY+25);
   
  fill(0);
  ellipse(leftPupilX, leftPupilY, 50, 50);
  ellipse(rightPupilX, rightPupilY, 50, 50);
}
