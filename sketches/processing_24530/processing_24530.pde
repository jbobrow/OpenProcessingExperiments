
import processing.pdf.*;

///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
 
int X = 80;
int Y = 80;
 
 
void setup() {
  size(200,400);
 // beginRecord(PDF, "Waves.pdf");
  background(50,95,230);
  
 
 
  for(int i = -40; i < width/X+40; i++) {
    for(int j = -40; j < height/Y+40; j++) {
      pushMatrix();
      translate(i*X, j*Y);
      yourFunction();
      popMatrix();
    }
  }
    //endRecord();
}
 
 
void draw()
{
 
  //This is here so the program keeps running and the screengrab will work
}
 
 
void yourFunction() {
 
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
 
  fill(50,95,230);
  stroke(0,0);
  strokeWeight(0);     //this section draws the main criles that make up the wave
  ellipse(X/2,Y/2,X,Y);
  fill(60,110,230); 
  ellipse(7*X/8,Y/2,X,Y);
   
  fill(50,95,230);
  arc(7*X/8,Y/2,X,Y,0,5*PI/8); //this scetion blocks in an area at the bottom of the wave that did no orginallymake the wave contiuos
  fill(60,110,230);
  arc(X/2,Y/2,X,Y,0,3*PI/8);
   
   
  stroke(255,40); //This puts the white line on the back of the waves
  noFill();
  strokeWeight(2);
  smooth();
  strokeCap(ROUND);
  arc(X/2,Y/2,X,Y,97*PI/100,39*PI/24);
  strokeWeight(2);
  arc(X/2,Y/2,X,Y,0,3*PI/8);
  

}
 


