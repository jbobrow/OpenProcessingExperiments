
//////////////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011        ///
/// Pattern by Kirawat Sahasewiyon, 1st March 2011 ///
//////////////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,500);
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  //rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  smooth();
  
  for(int i = -1; i < width/patternSeperationX + 1; i++){
      for(int j = -1; j < height/patternSeperationY + 1; j++){
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
  
  int centerX = patternSeperationX / 2;
  int centerY = patternSeperationY / 2;
  
  noFill();
  
  quad(-20, centerY, centerX, -20, patternSeperationX + 20, centerY, centerX, patternSeperationY + 20);  
  quad(-18, centerY, centerX, -18, patternSeperationX + 18, centerY, centerX, patternSeperationY + 18);
  quad(-7, centerY, centerX, -7, patternSeperationX + 7, centerY, centerX, patternSeperationY + 7);
  
  ellipse(0, centerY, 14, 14);                   // circle left
  ellipse(centerX, 0, 14, 14);                   // circle top
  
  ellipse(centerX - 12, centerY, 28, 18);        // left leaf
  ellipse(centerX + 12, centerY, 28, 18);        // right leaf
  ellipse(centerX, centerY - 12, 18, 28);        // top leaf
  ellipse(centerX, centerY + 12, 18, 28);        // bottom leaf
  
  ellipse(centerX - 12, centerY, 22, 14);        // left leaf
  ellipse(centerX + 12, centerY, 22, 14);        // right leaf
  ellipse(centerX, centerY - 12, 14, 22);        // top leaf
  ellipse(centerX, centerY + 12, 14, 22);        // bottom leaf
  
  ellipse(centerX, centerY, 10, 10);             // center circle
  
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

