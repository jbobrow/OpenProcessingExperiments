
//////////////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011        ///
/// Pattern by Kirawat Sahasewiyon, 5th March 2011 ///
//////////////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 20;
int patternSeperationY = 20;


void setup() {
  size(500,500);

  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  smooth();

  for(int i = 0; i < width/patternSeperationX; i++) {
    for(int j = 0; j < height/patternSeperationY; j++) {
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


void yourFunction() {

  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  
  int i;
  for (i = 0; i < patternSeperationY; i++)
  {
    stroke(random(0, 255));
    line(0, i, patternSeperationX, i);
  }
  
  for (i = 0; i < patternSeperationX; i++)
  {
    float c = random(0, 255);
    float a = random(50, 255);
    stroke(c, c, c, a);
    line(i, 0, i, patternSeperationY);
  }
  
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


