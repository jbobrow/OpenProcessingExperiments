
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup() {
  size(500, 500);
  smooth();
  
  noFill();
  
  stroke(175);
}


void draw()
{
  background(21);  // clear the screen

  for(int i = 0; i < width/patternSeperationX; i++) {
    for(int j = 0; j < height/patternSeperationY; j++) {
      pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
      popMatrix();
    }
  }
}


void yourFunction() {
  for (int i=0; i<100; i+=10) {
    ellipse(i, i, i, i);
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


