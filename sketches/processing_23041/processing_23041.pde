
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  background(255);
  size(500,500);
  smooth();
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
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
  
fill(80, 40, 170, 75);
noStroke();
ellipse(50, 50, 100, 100);
fill(80, 40, 170, 25);
noStroke();
ellipse(25, 50, 100, 100);
fill(80, 40, 170, 50);
noStroke();
ellipse(75, 50, 100, 100);
fill(80, 40, 170, 25);
noStroke();
ellipse(100, 100, 30, 30);
fill(80, 40, 170, 25);
noStroke();
ellipse(100, 100, 75, 75);
fill(80, 40, 170, 25);
noStroke();
ellipse(50, 50, 30, 30);
fill(80, 40, 170, 25);
noStroke();
ellipse(50, 50, 60, 60);
fill(80, 40, 170, 25);
noStroke();
ellipse(50, 100, 30, 30);
fill(80, 40, 170, 25);
noStroke();
ellipse(100, 50, 15, 15);
  
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

