
// eye movement vars
int leftEyeX = 225;
int leftEyeY;
int rightEyeX = 275;
int rightEyeY;
float leftPupilX;
float leftPupilY;
float rightPupilX;
float rightPupilY;
float leftAngle;
float rightAngle;
float leftDist;
float rightDist;
int eyeRadius = 35;
int pupilRadius = 5;
// head bob vars
int moveVector = 1;
int moveY = 325;
int moveTOP = 300;
int moveBOTTOM = 325;
int wordTick = 0;
float r = 0;
float g = 0;
float b = 0;
int tick = 1;

void setup (){
  size(500,500); 
  frameRate(20);
  smooth();
}
void draw(){
  // background colour
  background(r,g,b);
  r = mouseX;
  b = mouseY; 
  if (g < 255 && tick == 1)
    g++;
  if (g==255){
    g--;
    tick = -1;
  }
  if (g >-1 && tick == -1)
    g--;
  if (g == 0)
  {
    g++;
    tick = 1;
  } 
//----------------------------------------------------------
  // movement of head
   if(moveVector == 1 && moveY > moveTOP){
     moveY--;
   }
   if(moveY == moveTOP){
     moveY++;
     moveVector = -1;
   }
   if(moveVector == -1 && moveY < moveBOTTOM){
     moveY++;
   }
   if(moveY == moveBOTTOM){
     moveY--;
     moveVector = 1;
     wordTick +=5;
   }
 
  // movement of eye pupils
    // vars dec
    leftEyeY = moveY-15;
    rightEyeY = moveY-15;
    // left pupil
    leftDist = dist(mouseX, mouseY, leftEyeX, leftEyeY);
    leftAngle = acos((mouseX-leftEyeX)/leftDist);
    if(mouseY <= leftEyeY){
      leftAngle= PI*2 - leftAngle;
    }
    if(leftDist < (eyeRadius-pupilRadius)){
      leftPupilX = mouseX;
      leftPupilY = mouseY;
    }
    else {
      leftPupilX = cos(leftAngle)*(eyeRadius - pupilRadius)/5 + leftEyeX;
      leftPupilY = sin(leftAngle)*(eyeRadius - pupilRadius)/5 + leftEyeY;
    }
    // right pupil
    rightDist = dist(mouseX, mouseY, rightEyeX, rightEyeY);
    rightAngle = acos((mouseX-rightEyeX)/rightDist);
    if(mouseY <= rightEyeY){
      rightAngle= PI*2 - rightAngle;
    }
    if(rightDist < (eyeRadius-pupilRadius)){
      rightPupilX = mouseX;
      rightPupilY = mouseY;
    }
    else {
      rightPupilX = cos(rightAngle)*(eyeRadius - pupilRadius)/5 + rightEyeX;
      rightPupilY = sin(rightAngle)*(eyeRadius - pupilRadius)/5  + rightEyeY;
    }
//----------------------------------------------------------     
 // creature arms
    stroke(225,174,125);
    strokeWeight(3);
    line(185,350,190,moveY);
    line(315,350,310,moveY);
 
 // creature head
    //head + mouth + hat + eyes
    stroke(0);
    strokeWeight(1);
    fill(255);
    ellipse(250,moveY,130,100); // head
    fill(0);
    ellipse(250,moveY-42,75,15); //hat brim
    arc(250, moveY-42, 50, 75, -PI, 0); // hat top
    stroke(255);
    strokeWeight(10);
    line(231, moveY-49, 269, moveY-49); // hat stripe
    strokeWeight(1);
    stroke(124,0,0);
    noFill();
    ellipse(225,moveY-15,35,35); // left eye
    ellipse(275,moveY-15,35,35); // right eye
    strokeWeight(5);
    stroke(0);
    curve(225,moveY+5,231,moveY+20, 269, moveY+20,275,moveY+5); // smile
    stroke(124,0,0);
    strokeWeight(2);
    line(242, moveY-22, 258, moveY-22); // eyeglass nose line
    //line(#,#,208,moveY-22);
    //line(292,moveY-22,#,#);
    strokeWeight(1);
    stroke(0);
    
  // eye pupils
    fill(0);
    //left
    ellipse(leftPupilX,leftPupilY,2*pupilRadius,2*pupilRadius);
    //right
    ellipse(rightPupilX,rightPupilY,2*pupilRadius,2*pupilRadius);
   
    
    
    
//----------------------------------------------------------  
 // Wall
  
  fill(210);
  rect(0,350,500,150); // wall
  stroke(225,174,125);
  strokeWeight(3);
  line(185,350,175,365);
  line(185,350,185,365);
  line(185,350,195,365);
  line(315,350,305,365);
  line(315,350,315,365);
  line(315,350,325,365);
  
  
  
// words


}
