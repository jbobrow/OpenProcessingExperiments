
//////////////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011        ///
/// Pattern by Kirawat Sahasewiyon, 7th March 2011 ///
//////////////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,500);
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  smooth();
  
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
  
  fill(255);
  rect(0, 0, patternSeperationX, patternSeperationY);
  
  noiseGenerator(0, 0, patternSeperationX, patternSeperationY, 0, 255, 0, 50);
  
  int x, y = 0;
  int start = 0;
  for (int i = 0; i < (patternSeperationX / 10); i++)
  {
    for (x = start; x < patternSeperationX; x += 10)
    {
      line(x, y, x + 10, y);
      line(x + 10, y, x + 10, y + 10);
      y += 10;
    }
    y = 0;
    start += 10;
  }
  
}

void noiseGenerator(int x, int y, int areaWidth, int areaHeight, int low, int high, int lowA, int highA)
{
  float colour;
  for (int posX = x; posX < areaWidth; posX++)
  {
    for (int posY = y; posY < areaHeight; posY++)
    {
      colour = random(low, high);
      stroke(colour, colour, colour, random(lowA, highA));
      point(posX, posY);
    }
  }
  stroke(0);
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

