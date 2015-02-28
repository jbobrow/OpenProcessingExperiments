
int frame = 0;
int saving = 0;
float centerX;
float centerY;
float rectAlpha = 0;
float r = 0;
float theta = 0;
float inc = 0.1;
float ellipseRad = 4;
float ballR = 0;
float ballTheta = 0;
float ballInc = 0.1;
float ballRad = 0.7;
float ballStroke = 0.5;
//ballTwo
float ballRTwo = 0;
float ballThetaTwo = 0;
float ballIncTwo = 0.1;
float ballRadTwo = 0.1;
float ballStrokeTwo = 0.5;
//ballThree
float ballRThree = 0;
float ballThetaThree = 0;
float ballIncThree = 0.1;
float ballRadThree = 0.7;
float ballStrokeThree = 0.5;
//ballFour
float ballRFour = 0;
float ballThetaFour = 0;
float ballIncFour = 0.1;
float ballRadFour = 0.7;
float ballStrokeFour = 0.5;
//ballFive
float ballRFive = 0;
float ballThetaFive = 0;
float ballIncFive = 0.1;
float ballRadFive= 0.7;
float ballStrokeFive = 0.5;
//ballSix
float ballRSix = 0;
float ballThetaSix = 0;
float ballIncSix = 0.1;
float ballRadSix= 0.7;
float ballStrokeSix = 0.5;
//ballSeven
float ballRSeven = 0;
float ballThetaSeven = 0;
float ballIncSeven = 0.1;
float ballRadSeven= 0.7;
float ballStrokeSeven = 0.5;
//ballEight
float ballREight = 0;
float ballThetaEight = 0;
float ballIncEight = 0.1;
float ballRadEight= 0.7;
float ballStrokeEight = 0.5;
//ballNine
float ballRNine = 0;
float ballThetaNine = 0;
float ballIncNine = 0.1;
float ballRadNine= 0.7;
float ballStrokeNine = 0.5;

int frameCount = 0;
PImage lastFrame = new PImage();

void setup() {
  size(900,450);
  smooth();
  background(176,180,60);
  lastFrame = get();
}

void draw() {
  //spiral
  float x = r * cos(theta);
  float y = r * sin(theta);
    
    //spiral draw~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    image(lastFrame, 0, 0);
    if(dist(width/2, height/2, x+width/2, y+height/2) <= width/2) {
    noStroke();
    fill(255, 30);
    ellipse(x+width/2, y+height/2, ellipseRad += 0.01, ellipseRad += 0.01);
    
    theta += 0.02; //larger value makes ball draw faster
    r += inc;
    inc += 0.0003; //larger value makes wider spiral
    lastFrame = get(); //get image
    frameCount ++; //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    }
    if(frameCount >= 300) {
     
    //ball~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    float ballX = ballR * cos(ballTheta); //new variable for ball starting point
    float ballY = ballR * sin(ballTheta);
    
    strokeWeight(ballStroke += 0.0015);
    stroke(22,2,38);
    fill(42,4,74);
    ellipse(ballX+width/2, ballY+height/2, ballRad += 0.01, ballRad += 0.01); //negative number added to x-starting point shifts ball
    
    ballTheta += 0.02; //larger value makes ball draw faster 
    ballR += ballInc;
    ballInc += 0.0003; //larger value makes wider spiral
    }
    if(frameCount >= 450) {
     
    //ballTwo~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    float ballXTwo = ballRTwo * cos(ballThetaTwo); //new variable for ball starting point
    float ballYTwo = ballRTwo * sin(ballThetaTwo);
    
    strokeWeight(ballStrokeTwo += 0.0015);
    stroke(64,11,32);
    fill(110,20,56);
    ellipse(ballXTwo+width/2, ballYTwo+height/2, ballRadTwo += 0.005, ballRadTwo += 0.005); //negative number added to x-starting point shifts ball
    
    ballThetaTwo += 0.02; //larger value makes ball draw faster 
    ballRTwo += ballIncTwo;
    ballIncTwo += 0.0003; //larger value makes wider spiral
    }
    if(frameCount >= 550) {
     
    //ballThree~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    float ballXThree = ballRThree * cos(ballThetaThree); //new variable for ball starting point
    float ballYThree = ballRThree * sin(ballThetaThree);
    
    strokeWeight(ballStrokeThree += 0.0015);
    stroke(145,26,30);    
    fill(204,34,39);
    ellipse(ballXThree+width/2, ballYThree+height/2, ballRadThree += 0.008, ballRadThree += 0.008); //negative number added to x-starting point shifts ball
    
    ballThetaThree += 0.02; //larger value makes ball draw faster 
    ballRThree += ballIncThree;
    ballIncThree += 0.0003; //larger value makes wider spiral
    }
    if(frameCount >= 680) {
     
    //ballFour~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    float ballXFour = ballRFour * cos(ballThetaFour); //new variable for ball starting point
    float ballYFour = ballRFour * sin(ballThetaFour);
    
    strokeWeight(ballStrokeFour += 0.0015);
    stroke(91,68,32);    
    fill(115,86,40);
    ellipse(ballXFour+width/2, ballYFour+height/2, ballRadFour += 0.01, ballRadFour += 0.01); //negative number added to x-starting point shifts ball
    
    ballThetaFour += 0.02; //larger value makes ball draw faster 
    ballRFour += ballIncFour;
    ballIncFour += 0.0003; //larger value makes wider spiral
    }
    if(frameCount >= 760) {
    
    //ballFive~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    float ballXFive = ballRFive * cos(ballThetaFive); //new variable for ball starting point
    float ballYFive = ballRFive * sin(ballThetaFive);
    
    strokeWeight(ballStrokeFive += 0.0015);
    stroke(145,26,30);    
    fill(204,34,39);
    ellipse(ballXFive+width/2, ballYFive+height/2, ballRadFive += 0.01, ballRadFive += 0.01); //negative number added to x-starting point shifts ball
    
    ballThetaFive += 0.02; //larger value makes ball draw faster 
    ballRFive += ballIncFive;
    ballIncFive += 0.0003; //larger value makes wider spiral
    }
    if(frameCount >= 910) {
     
    //ballSix~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    float ballXSix = ballRSix * cos(ballThetaSix); //new variable for ball starting point
    float ballYSix = ballRSix * sin(ballThetaSix);
    
    strokeWeight(ballStrokeSix += 0.0015);
    stroke(6,24,46);    
    fill(11,46,89);
    ellipse(ballXSix+width/2, ballYSix+height/2, ballRadSix += 0.006, ballRadSix += 0.006); //negative number added to x-starting point shifts ball
    
    ballThetaSix += 0.02; //larger value makes ball draw faster 
    ballRSix += ballIncSix;
    ballIncSix += 0.0003; //larger value makes wider spiral
    }
    if(frameCount >= 1000) {
     
    //ballSeven~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    float ballXSeven = ballRSeven * cos(ballThetaSeven); //new variable for ball starting point
    float ballYSeven = ballRSeven * sin(ballThetaSeven);

    strokeWeight(ballStrokeSeven += 0.0015);
    stroke(22,2,38);    
    fill(42,4,74);
    ellipse(ballXSeven+width/2, ballYSeven+height/2, ballRadSeven += 0.01, ballRadSeven += 0.01); //negative number added to x-starting point shifts ball
    
    ballThetaSeven += 0.02; //larger value makes ball draw faster 
    ballRSeven += ballIncSeven;
    ballIncSeven += 0.0003; //larger value makes wider spiral
    }
    if(frameCount >= 1150) {
     
    //ballEight~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    float ballXEight = ballREight * cos(ballThetaEight); //new variable for ball starting point
    float ballYEight = ballREight * sin(ballThetaEight);

    strokeWeight(ballStrokeEight += 0.0015);
    stroke(7,56,49);    
    fill(13,103,89);
    ellipse(ballXEight+width/2, ballYEight+height/2, ballRadEight += 0.01, ballRadEight += 0.01); //negative number added to x-starting point shifts ball
    
    ballThetaEight += 0.02; //larger value makes ball draw faster 
    ballREight += ballIncEight;
    ballIncEight += 0.0003; //larger value makes wider spiral
    }
    if(frameCount >= 1310) {
     
    //ballNine~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    float ballXNine = ballRNine * cos(ballThetaNine); //new variable for ball starting point
    float ballYNine = ballRNine * sin(ballThetaNine);

    strokeWeight(ballStrokeNine += 0.0015);
    stroke(6,24,46);    
    fill(11,46,89);
    ellipse(ballXNine+width/2, ballYNine+height/2, ballRadNine += 0.01, ballRadNine += 0.01); //negative number added to x-starting point shifts ball
    
    ballThetaNine += 0.02; //larger value makes ball draw faster 
    ballRNine += ballIncNine;
    ballIncNine += 0.0003; //larger value makes wider spiral
    }
  
  /*
  if(saving == 0) {
    saveFrame("holly-#####.tif");
    saving += 1;
  } else if (saving == 1) {
    saving -= 1;
  }
  */
  //save frames  
  /*saveFrame("holly-#####.jpg"); //frame collection
  frame = frame + 1;
  
  if (frame > 1800) {
    exit();
  }*/
}//end of draw////////////////////

/*void mousePressed() {
  saveFrame("image####.tif");
}
*/

/*
colors
42,4,74 (purple); (22,2,38) //1,7
13,103,89 (teal); (7,56,49) //8
11,46,89 (blue); (6,24,46) //6,9
115,86,40 (brown); (91,68,32) //4
110,20,56 (purple); (64,11,32) //2
204,34,39 (red); (145,26,30) //3,5
*/
