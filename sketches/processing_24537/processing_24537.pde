
import processing.pdf.*;

///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////



int X = 160;
int Y = 160;


void setup() {
  size(200,400);
 //beginRecord(PDF, "Fall.pdf");
  background(50,95,230);



  for(int i = -40; i < width/X+40; i++) {
    for(int j = -40; j < height/Y+40; j++) {
      pushMatrix();
      translate(i*X, j*Y);
      yourFunction();
      popMatrix();
    }
  }
 // endRecord();
}


void draw()
{

  //This is here so the program keeps running and the screengrab will work
}


void yourFunction() {

  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
 smooth();


  noFill();
  strokeWeight(5);
  strokeCap(SQUARE);
  stroke(255,150);
  arc(X/2,Y/4,X/2,X/2,PI*3/2,2*PI);
  arc(X,Y/4,X/2,X/2,PI/2,PI);
  arc(X/2,Y*3/4,X/2,X/2,PI/2,PI);
  arc(0,Y*3/4,X/2,X/2,PI*3/2,2*PI);
  
  strokeWeight(1);
  arc(X/2-10,Y/4+10,X/2,X/2,PI*3/2,2*PI);
  arc(X-10,Y/4+10,X/2,X/2,PI/2,PI);
  arc(X/2-10,Y*3/4+10,X/2,X/2,PI/2,PI);
  arc(0-10,Y*3/4+10,X/2,X/2,PI*3/2,2*PI);

  arc(X/2+10,Y/4-10,X/2,X/2,PI*3/2,2*PI);
  arc(X+10,Y/4-10,X/2,X/2,PI/2,PI);
  arc(X/2+10,Y*3/4-10,X/2,X/2,PI/2,PI);
  arc(0+10,Y*3/4-10,X/2,X/2,PI*3/2,2*PI);
  
noStroke();
fill(50,50);
ellipse(X/2,Y/4,X/2,X/2);
ellipse(X,Y/4,X/2,X/2);
ellipse(X/2,Y*3/4,X/2,X/2);
ellipse(0,Y*3/4,X/2,X/2);

}



