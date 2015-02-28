
//declare global variables
int wideEye = 20;
int eyeLength = 10;
int pupilSize = 10;
int earSpot = -50;
int innerEar = -45;
int pupilPupil = 5;
int noseSpot = 2;
int lineOne = -20;
int lineTwo = 20;

boolean clicked = false;

void setup(){
  size(300,300);
  background(155,0,0);

}

void keyPressed(){
   background(155,0,0);
  clicked =! clicked;
   if (clicked == false){
    eyeLength = 10;
    wideEye = 20;
    pupilSize = 10;
    earSpot = -50; 
    innerEar = -45;
    pupilPupil = 5;
    noseSpot = 2;
    lineOne = -20;
    lineTwo = 20;
  } 
  if (clicked == true){
    eyeLength = 20;
    wideEye = 40;
    pupilSize = 20;
    earSpot = -70;
    innerEar = -65; 
    pupilPupil = 10; 
    noseSpot = 10;
    lineOne = -35;
    lineTwo = 35;
  }
}

//runs forever
void draw(){
//faceshape
  noStroke();
  translate(150,150);
  fill(106,155,89);
  ellipse(0,0,125,100);

  fill(106,155,89);
  ellipse(0,-8,115,120);

  fill(106,155,89);
  ellipse(0,30,50,50);

//ears
  triangle(45,-40,55,-8,125,earSpot);

  triangle(-45,-40,-55,-8,-125,earSpot);
  
  fill(59,89,57);
  triangle(58,-32,60,-15,115,innerEar);

  triangle(-58,-32,-60,-15,-115,innerEar);


//eyes
  fill(255,255,255);
  ellipse(25,-10,wideEye,eyeLength);

  fill(255,255,255);
  ellipse(-25,-10,20,10);

//pupils
  noStroke();
  fill(102,51,0);
  ellipse(25,-10,pupilSize,pupilSize);
  
  fill(102,51,0);
  ellipse(-25,-10,pupilSize,pupilSize);
  
  fill(0,0,0);
  ellipse(25,-10,5,5);
  
  fill(0,0,0);
  ellipse(-25,-10,pupilPupil,pupilPupil);
  
  //nose
  fill(83,137,90);
  ellipse(0,noseSpot,20,10);
  
  //mouth
  stroke(0);
  strokeWeight(2);
  line(lineOne,25,lineTwo,25);

}




