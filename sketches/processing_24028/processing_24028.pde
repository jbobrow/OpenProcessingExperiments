
import processing.pdf.*;

///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 110;
int patternSeperationY = patternSeperationX;


void setup(){
  size(500,500);
  beginRecord(PDF,"fileName.pdf");
  smooth();
  //the white box simply shows you the space your pattern gets drawn in
  
  for(int i = 0; i < width/patternSeperationX+1; i++){
      for(int j = 0; j < height/patternSeperationY+1; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
  
  endRecord();//important, pdf wont save unless you say endRecord.
  
}


void draw()
{
  //This is here so the program keeps running and the screengrab will work
}


void yourFunction(){
  
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)

  
  noStroke();
  
  color from = color(50,230,80);
  color to = color(230,80,50);
  
  float value=5.0;
  
  for(float counter=1; counter<value+1; counter++){
    float squaresize = (patternSeperationX/value)*(value-counter);//value-counter reverses the order of the squares drawing....... why?
    color inter = lerpColor(from,to,(1/value)*counter);
  
    fill(inter); 
    rectMode(CENTER);
    rect(patternSeperationX/2,patternSeperationX/2,squaresize,squaresize);
  } 

  
}


