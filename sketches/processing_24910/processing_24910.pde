
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
import processing.pdf.*;

//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 48;
int patternSeperationY = 100;


void setup(){
  size(528,500);
  smooth();
  beginRecord(PDF, "diamonds.pdf");
  
  //the white box simply shows you the space your pattern gets drawn in

    fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  background(100);
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
endRecord();  
}


void draw()
{
  //This is here so the program keeps running and the screengrab will work
}


void yourFunction(){
  
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  /*beginShape();
  vertex(25,0);
  vertex(0,50);
  vertex(25,100);
  vertex(50,50);
  endShape(CLOSE);
  */
  fill(255,0,0);
  beginShape();
  vertex(24,0);
  vertex(12,25);
  vertex(24,50);
  vertex(36,25);
  endShape(CLOSE);
  
  fill(0,255,0);
  beginShape();
  vertex(24,50);
  vertex(12,75);
  vertex(24,100);
  vertex(36,75);
  endShape(CLOSE);
  
  fill(0,0,255);
  beginShape();
  vertex(12,25);
  vertex(24,50);
  vertex(12,75);
  vertex(0,50);
  endShape(CLOSE);
  
  fill(255,235,0);
  beginShape();
  vertex(36,25);
  vertex(24,50);
  vertex(36,75);
  vertex(48,50);
  endShape(CLOSE);
  
  /*
  line(0,0,25,50);
  line(25,50,0,100);
  line(25,50,50,0);
  line(25,50,50,100);
  line(0,50,12,26);
  line(0,50,12,74);
  line(50,50,38,26);
  line(50,50,38,74);*/
}

void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}

