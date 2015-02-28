
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;



void setup() {
  size(500,500);
  smooth();
  //the white box simply shows you the space your pattern gets drawn in
  
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  background(0);

  for(int i = -1; i < width/patternSeperationX; i++) {
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
void myDraw(int spX, int spY, int midX, int midY, int red1) {

  for(int i=0; i<25; i++) {
    stroke( 255,  red1,  red1);
    strokeWeight(1);
    line (spY, spX, midY, midX);
    midY +=4;
    red1-=5;
  }
}


void yourFunction() {

  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
 //bottom left
 myDraw (50, 0, 100, 0, 125);
 //top left
 myDraw (50, 100, 0, 100, 125);
 //bottom right
 myDraw (50, 100 , 100, 0, 255);
 //top right
 myDraw (50, 100, 0, 0, 255);


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


