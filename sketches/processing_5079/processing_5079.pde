
//import processing.pdf.*;

/*
Random number spiral
Oct 6, 2009
*/

float turn = 0; //
float noiseNum = 0; //have to assign value to variable

void setup() {
  size(500,500);
  background(255);
  smooth();
  noiseSeed(31);
  //beginRecord(PDF, "export.pdf");
}

void draw() {
 translate(width/2, height/2);//translate the origin
 rotate(turn);

 float end = noise(noiseNum) * 150;
 noiseNum = noiseNum + 0.01;
 stroke(220,100,20,25);
 line(end-20,end+40,end,0); //always draw the x coordinate
 ellipse(end,0,1,1);
 
 turn = turn +0.1; 
} 

void mousePressed() {
  //End PDF recroding
  endRecord();
  exit();
}

