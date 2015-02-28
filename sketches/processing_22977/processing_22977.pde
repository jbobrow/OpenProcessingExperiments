
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
  ellipse(100, 0, 15, 15);
  stroke(#F660AB);
  strokeWeight(2);
  noFill();
  beginShape();
  curveVertex(0, 0); // the first control point
  curveVertex(0, 0); // is also the start point of curve
  curveVertex(25, 50);
  curveVertex(50, 75);
  curveVertex(100, 100); // the last point of curve
  curveVertex(100, 100); // is also the last control point
  endShape();
    beginShape();
  curveVertex(0, 0); // the first control point
  curveVertex(0, 0); // is also the start point of curve
  curveVertex(50, 25);
  curveVertex(75, 50);
  curveVertex(100, 100); // the last point of curve
  curveVertex(100, 100); // is also the last control point
  endShape();
  fill(#F660AB);
  ellipse(50, 50, 40, 40);
  noFill();
  ellipse(50, 50, 100, 100);
  ellipse(50, 50, 75, 75);
      stroke(#FFFFFF);
      noFill();
    strokeWeight(1);
  ellipse(60, 60, 35, 35);
  ellipse(70, 70, 30, 30);
  ellipse(80, 80, 25, 25);
  ellipse(90, 90, 20, 20);
  ellipse(100, 100, 15, 15);
  ellipse(40, 40, 35, 35);
  ellipse(30, 30, 30, 30);
  ellipse(20, 20, 25, 25);
  ellipse(10, 10, 20, 20);
  ellipse(60, 40, 35, 35);
  ellipse(70, 30, 30, 30);
  ellipse(80, 20, 25, 25);
  ellipse(90, 10, 20, 20);
  ellipse(40, 60, 35, 35);
  ellipse(30, 70, 30, 30);
  ellipse(20, 80, 25, 25);
  ellipse(10, 90, 20, 20);



   
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


