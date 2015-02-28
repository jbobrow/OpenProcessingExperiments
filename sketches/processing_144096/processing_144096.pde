
import processing.pdf.*;

int x = 0;
//declare global variables
float wideEye = 20;
float eyeLength = 10;
float pupilSize = 10;
float earSpot = -50;
float pupilPupil = 5;
float spotOne = -50;
float noseRed = 83;
float noseGreen = 137;
float noseBlue = 90;
float lineSpot = 25;
float noseSpot = 0;
float eyeRed = 0;
float faceSize = 125;
float faceLength = 125;


void setup(){
  size(3300,5100);
  background(127,0,255);
  beginRecord(PDF, "final1.pdf");
  translate(250,150);
  noStroke();
  repeatShape();
  endRecord();
}


void draw(){
  
}

void makeFace(){
    eyeLength = random(10,20);
    wideEye = random(20,40);
    pupilSize = random(10,20);
    pupilPupil = random(5,10); 
    spotOne = random(-90,-20);
    earSpot = random(-70,-10);
    noseRed = random(0,255);
    noseGreen = random(0,255);
    noseBlue = random(0,255);
    lineSpot = random(15,40);
    noseSpot = random(0,10);
    eyeRed = random(0,255);
    faceSize = random(125,180);
    faceLength = random(125,140);

//background
fill(127,0,255);
noStroke();
//faceshape
  noStroke();
  fill(106,155,89);
  ellipse(0,0,faceSize,100);

  fill(106,155,89);
  ellipse(0,-8,115,faceLength);

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
  ellipse(25,-10,5,5);
  
  fill(eyeRed,0,0);
  ellipse(-25,-10,pupilPupil,pupilPupil);
  
  //nose
  fill(noseRed,noseGreen,noseBlue);
  ellipse(0,noseSpot,20,10);
  
  //mouth
  stroke(0);
  strokeWeight(2);
  line(-20,lineSpot,20,lineSpot);

}


void repeatShape(){
  for (int i=0; i < 600; i++){
    println("MEH" + i);
    makeFace();
    translate(275,0);   //distance between each colum //256
    x++;
    if (x == 11){
      x = 0;
      translate(-3025,300);    //224  //-2816 //11xn
    }
  }
 }



