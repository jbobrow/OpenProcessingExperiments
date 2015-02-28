
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
    smooth();
  background(0);
  size(500,500);
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(0);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(225);
  
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
  
stroke (225);
triangle(0, 0, 30, 40, 40, 30);
triangle (0, 0, 35, 35, 30, 40);
quad (30, 40, 50, 20, 50, 55, 35, 45);
quad (30, 40, 35, 45, 0, 80, 20, 40);
quad (35, 45, 50, 50, 50, 60, 0, 80);
triangle (50, 20, 55, 40, 50, 50);
triangle (50, 20, 70, 0, 52, 29);
quad (50, 50, 70, 25, 85, 10, 55, 70);
line (70, 0, 70, 25);
line (55, 70, 40, 65);
line (60, 65, 70, 65);
line (70, 65, 85, 20);
line (70, 25, 88, 5);
line (88, 5, 100, 17);
line (85, 10, 100, 17);
line (100, 17, 82, 20);


 











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

