
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,500);
  smooth ();
  
  //the white box simply shows you the space your pattern gets drawn in
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
noStroke ();  
fill (242, 89, 62, 40);
ellipse(50, 50, 100, 100);
noFill ();
fill (200, 89, 62, 60);
ellipse(50, 50, 80, 80);
noFill ();
fill (150, 60, 62, 80);
ellipse(50, 50, 60, 60);
noFill ();
fill (100, 40, 62, 100);
ellipse(50, 50, 40, 40);
noFill ();
fill (100, 0, 0);
ellipse(50, 50, 20, 20);
noFill ();
stroke (100, 0, 0);
quad(0, 50, 50, 0, 100, 50, 50, 100);
quad(20, 50, 50, 20, 80, 50, 50, 80);
quad(10, 50, 50, 10, 90, 50, 50, 90);
quad(-10, 50, 50, -10, 110, 50, 50, 110);
quad(-20, 50, 50, -20, 120, 50, 50, 120);
  
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

