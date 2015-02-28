
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,500);
  smooth ();
  background(135, 206, 250);
  
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(135, 206, 250);
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
  
  stroke (0, 0, 128);
  line (0, 0, 20, 0);
  line (20, 0, 20, 20);
  line (20, 20, 40, 20);
  line (40, 20, 40, 40);
  line (40, 40, 60, 40);
  line (60, 40, 60, 60);
  line (60, 60, 80, 60);
  line (80, 60, 80, 80);
  line (80, 80, 100, 80);
  line (100, 80, 100, 100);
  noStroke ();
  stroke (40, 20, 62);
  line (65, 0, 65, 65);
  line (65, 65, 85, 65);
  line (85, 65, 85, 85);
  line (85, 85, 105, 85);
  line (105, 85, 105, 105);  
  noStroke ();
  stroke (70, 20, 30);
  line (30, 0, 30, 30);
  line (30, 30, 60, 30);
  line (60, 30, 60, 60);
  line (60, 60, 75, 60);
  line (75, 60, 75, 75); 
  
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

