
//////////////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011        ///
/// Pattern by Kirawat Sahasewiyon, 4th March 2011 ///
//////////////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,500);
  
  //the white box simply shows you the space your pattern gets drawn in
  //fill(255);
  //noStroke();
  //rect(0,0,patternSeperationX,patternSeperationY);
  //stroke(0);
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
  
  // background colour
  fill(255, 242, 209);
  noStroke();
  rect(0, 0, patternSeperationX, patternSeperationY);
  stroke(0);
  
  // draw noises
  noiseGenerator(0, 0, patternSeperationX, patternSeperationY, 235, 235, 186, 241, 91, 214, 180, 255);
  
  // draw lines
  int lineStart = 30;
  for (int i = 0; i < 5; i++)
  {
    line(0, lineStart + (i * 10), patternSeperationX, lineStart + (i * 10));
  }
  line(0, lineStart, 0, lineStart + 40);
  
  // draw notes
  drawNote(13, 55);
  drawNote(37, 50);
  strokeWeight(3);
  stroke(180, 180, 180, 150);
  line(20, 37, 42, 34);
  stroke(0);
  line(18, 35, 40, 32);
  strokeWeight(1);
  drawNote(61, 55);
  drawNote(85, 65);
}

void drawNote(int x, int y)
{
  // shadow
  stroke(180, 180, 180, 150);
  line(x + 6, y - 18, x + 6, y);
  fill(180, 180, 180, 150);
  ellipse(x + 2, y + 2, 8, 6);
  
  // note
  stroke(0);
  line(x + 4, y - 20, x + 4, y);
  fill(0);
  ellipse(x, y, 8, 6);
}

void noiseGenerator(int x, int y, int areaWidth, int areaHeight, int lowR, int highR, int lowG, int highG, int lowB, int highB, int lowA, int highA)
{
  for (int posX = x; posX < areaWidth; posX++)
  {
    for (int posY = y; posY < areaHeight; posY++)
    {
      stroke(random(lowR, highR), random(lowG, highG), random(lowB, highB), random(lowA, highA));
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

