
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 50;
int patternSeperationY = 50;


void setup(){
  size(500,500);
  smooth();
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  //rect(0,0,patternSeperationX,patternSeperationY);
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
  fill(180,100);
  stroke(255);
  

  
  
  triangle(30, 75, 58, 20, 86, 75);
  pushMatrix();
  translate(10, 20);
  fill(0);
  triangle(30, 75, 58, 20, 86, 75);
  popMatrix();
  fill(102);  
  triangle(random (30),random (75),random (58),random (20),random (86),random (75));
  

  
  //triangle(30, 75, 58, 20, 86, 75);
  pushMatrix();
  translate(40, 35);
  fill(255);
  //triangle(30, 75, 58, 20, 86, 75);
  popMatrix();
  fill(102);  
  //triangle(30, 75, 58, 20, 86, 75);
  
  
  
  
  
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

