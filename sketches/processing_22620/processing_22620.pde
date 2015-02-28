
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,500);
  smooth();
  //the white box simply shows you the space your pattern gets drawn in
  fill(155, 28, 28);
  background(155, 28, 28);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);

  for(int i = 0; i < 500/patternSeperationX; i++){
      for(int j = 0; j < 500/patternSeperationY; j++){
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
 
 noFill(); 
 stroke(255);
 bezier(0, 0,  0, 100,  100, 0,  100, 100);
 noStroke();
 fill(255, 188, 175);
 ellipse(30, 22, 30, 30);
 fill(255, 188, 175, 50);
 ellipse(30, 22, 40, 40);
 stroke(255);
 fill(0, 0, 255);
 ellipse(70, 80, 30, 30);
 stroke(255);
 noFill();
 ellipse(70, 80, 40, 40);

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

