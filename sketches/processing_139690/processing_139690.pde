
//declare global variables
int wideEye = 20;
int eyeLength = 10;
int pupilSize = 10;
float earSpot = -50;
int pupilPupil = 5;
float pupilMove = 25;
float moveTwo = -10;
float spotOne = -50;

boolean clicked = false;

void setup(){
  size(300,300);
  background(155,0,0);

}

void keyPressed(){
   background(155,0,0);
  clicked =! clicked;
    pupilMove = random(19,30);
    moveTwo = random(-15,-5);
    spotOne = random(-90,-20);
    earSpot = random(-70,-10);
}

//runs forever
void draw(){
  if (clicked == false){
    eyeLength = 10;
    wideEye = 20;
    pupilSize = 10;
    earSpot = -50;
    pupilPupil = 5;
    pupilMove = 25;
    moveTwo = -10;
  } 
  if (clicked == true){
    eyeLength = 20;
    wideEye = 40;
    pupilSize = 20;
    pupilPupil = 10; 
    earSpot = -70;
  }
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
  triangle(45,-40,55,-8,125,spotOne);

  triangle(-45,-40,-55,-8,-125,earSpot);
  

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
  ellipse(pupilMove,-10,5,5);
  
  fill(0,0,0);
  ellipse(-25,moveTwo,pupilPupil,pupilPupil);
  
  //nose
  fill(83,137,90);
  ellipse(0,0,20,10);
  
  //mouth
  stroke(0);
  strokeWeight(2);
  line(-20,25,20,25);

}




