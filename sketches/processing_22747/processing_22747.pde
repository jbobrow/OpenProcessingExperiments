
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,500);
  
  //the white box simply shows you the space your pattern gets drawn in
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
  
  noStroke();
  fill(6,6,4);
  quad(0, 0, 100, 0, 100, 100, 0, 100);
  
  noStroke();
  fill(60, 75, 72);
  smooth();
  ellipse(25, 25, 46, 46);
  triangle(48, 25, 48, 48, 25, 48);
  
  noStroke();
  fill(252, 252, 188);
  smooth();
  ellipse(75, 25, 46, 46);
  triangle(52, 25, 52, 48, 75, 48);
  
  noStroke();
  fill(141, 140, 96);
  smooth();
  ellipse(25, 75, 46, 46);
  triangle(25, 52, 48, 52, 48, 75);
  
  noStroke();
  fill(39, 27, 27);
  smooth();
  ellipse(75, 75, 46, 46);
  triangle(52, 52, 52, 75, 75, 52);
}

//  55 27.5 18.75
  
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

