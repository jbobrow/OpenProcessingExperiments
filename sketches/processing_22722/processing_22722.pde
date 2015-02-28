
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
 
 
void setup(){
  size(500,500);
   
  //the white box simply shows you the space your pattern gets drawn in
  background(#000000);
  noFill();
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
   
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
   
}
 
 
void draw()
{
  //This is here so the program keeps running and the screengrab will work
}
 
 
void yourFunction(){
   
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  
  smooth();
  stroke(#F660AB);
  strokeWeight(1);
  beginShape();
  curveVertex(0, 50); // the first control point
  curveVertex(0, 50); // is also the start point of curve
  curveVertex(25, 75);
  curveVertex(50, 50);
  curveVertex(75, 25);
  curveVertex(100, 50); // the last point of curve
  curveVertex(100, 50); // is also the last control point
  endShape();
    beginShape();
  curveVertex(50, 0); // the first control point
  curveVertex(50, 0); // is also the start point of curve
  curveVertex(75, 25);
  curveVertex(50, 50);
  curveVertex(25, 75);
  curveVertex(50, 100); // the last point of curve
  curveVertex(50, 100); // is also the last control point
  endShape();
    beginShape();
  curveVertex(0, 50); // the first control point
  curveVertex(0, 50); // is also the start point of curve
  curveVertex(25, 25);
  curveVertex(50, 50);
  curveVertex(75, 75);
  curveVertex(100, 50); // the last point of curve
  curveVertex(100, 50); // is also the last control point
  endShape();
    beginShape();
  curveVertex(50, 0); // the first control point
  curveVertex(50, 0); // is also the start point of curve
  curveVertex(25, 25);
  curveVertex(50, 50);
  curveVertex(75, 75);
  curveVertex(50, 100); // the last point of curve
  curveVertex(50, 100); // is also the last control point
  endShape();
  stroke(#1589FF);
  strokeWeight(2);
  ellipse(50, 50, 50, 50);
  ellipse(50, 50, 150, 150);
  ellipse(0, 0, 100, 100); 


   
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


