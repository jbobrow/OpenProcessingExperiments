
// FACE ANIMATION    Playing with ellipses
// PJC Thursday 05 June 2014
// Eyes follow mouse using mouseX
// 06 June use map() to replace 'if' statements
// 07 June mousePressed detected to change face to 'shocked'
// 08 June Text added
//
// Need work on colours
// Work possibly to rotate face (head)


int leftEyeStartX = 180;      // Left Outer Eye Start
int leftEyeStartY = 200;
float leftIrisX = leftEyeStartX;
float leftIrisY = leftEyeStartY;
float leftPupilX = leftIrisX;
float leftPupilY = leftIrisY;

int rightEyeStartX = 320;     // Right Outer Eye Start
int rightEyeStartY = 200;
float rightIrisX = rightEyeStartX;
float rightIrisY = rightEyeStartY;
float rightPupilX = rightIrisX;
float rightPupilY = rightIrisY;

int iris = 12;
int pupil = 10;

PFont f;                      // Declare PFont

void setup() {
    size(500,500);
    f = createFont("Arial",16,true); // Create Font
    background(200);
    textFont(f,24);                 // font size
    fill(255,0,80);                // font color 
    text("Move the mouse and click a button",65,50);   // Display Text
}
    
void draw() {
   // background(200);
        
    /*
    THESE IF STATEMENTS CAN BE REPLACED BY ONE map() LINE OF CODE
    
    if(mouseX > 240 && mouseX < 260) eyeMove = 0;
    if(mouseX < 240) eyeMove = -3;
    if(mouseX < 200) eyeMove = -6;
    if(mouseX < 150) eyeMove = -9;
    if(mouseX < 100) eyeMove = -12;
    if(mouseX < 50) eyeMove = -16;
    if(mouseX > 260) eyeMove = 3;
    if(mouseX > 300) eyeMove = 6;
    if(mouseX > 350) eyeMove = 9;
    if(mouseX > 400) eyeMove = 12;
    if(mouseX > 450) eyeMove = 16;    
    */    
        
        
    float  eyeMove = map(mouseX, 0, width, -16, 16);
          
    leftIrisX = leftEyeStartX + eyeMove;
    leftPupilX = leftIrisX;
    rightIrisX = rightEyeStartX + eyeMove;
    rightPupilX = rightIrisX; 
         
    stroke(0);
    strokeWeight(1);
    
    fill(#fcdbe4);
    ellipse(250,250,300,300);    // Face Outline
    
    fill(#f289ae);
    ellipse(250,250,20,40);      // nose
   // noFill();
    
    if (mousePressed == true) {
        fill(#fe658a);
        ellipse(100,230,20,100);     // left ear
        ellipse(400,230,20,100);     // right ear
    
        fill(#ff556a);
        ellipse(250,320,120,80);     // lips
    
      } else {
        fill(#fcdbe4);
        ellipse(100,230,20,100);     // left ear
        ellipse(400,230,20,100);     // right ear
    
        fill(#e9556a);
        ellipse(250,320,120,30);     // lips
      }
   
    fill(255);
    ellipse(leftEyeStartX,leftEyeStartY,60,30);  // left eye
    ellipse(rightEyeStartX,rightEyeStartY,60,30);  // right eye
    
    noFill();
    strokeWeight(12);
    stroke(220, 150, 50);
    ellipse(leftIrisX,leftIrisY,iris,iris);
    ellipse(rightIrisX, rightIrisY,iris,iris);
    strokeWeight(1);
    
    fill(0);
    ellipse(leftPupilX,leftPupilY,pupil,pupil);
    ellipse(rightPupilX, rightPupilY,pupil,pupil);
    noFill();
}







