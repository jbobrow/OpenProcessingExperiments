
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(510,500);
  smooth ();
  background(200, 300, 20);
  
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(200, 300, 20);
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
  
  noStroke ();
  fill (0, 0, 0);
  ellipse (60, 70, 10, 10);
  ellipse (40, 20, 10, 10);
  noFill ();
  stroke (0, 0, 0);
  noFill();
  stroke(0, 0, 0);
  bezier(60, 70, 150, 130, -20, -10, 40, 20);
  
  noStroke ();
  fill (0, 0, 0);
  ellipse (80, 40, 10, 10);
  ellipse (20, 50, 10, 10);
  noFill ();
  stroke (0, 0, 0);
  noFill();
  stroke(0, 0, 0);
  bezier(80, 40, 150, 130, -20, -10, 20, 50);
  
  noStroke ();
  fill (0, 100, 30, 40);
  triangle(60, 105, 88, 50, 116, 105);
  triangle(35, 80, 63, 25, 91, 80);
  triangle(10, 55, 38, 0, 66, 55);
  triangle(-15, 30, 13, -25, 41, 30);
  
  
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

