
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 5;
int patternSeperationY = 5;
int patternThingX=50;
int patternThingY=50;
int space = 10;

void setup() {
  size(500,500);

  //the white box simply shows you the space your pattern gets drawn in
  smooth();
  noFill();
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);

  noFill();
  noStroke();
  rect(0,0,patternThingX,patternThingY);

  noFill();
  rect(0,0,250,250);
  rect(250,250,500,500);
  noStroke();

  for(int i = 0; i < width/patternThingX; i++) {
    for(int j = 0; j < height/patternThingY; j++) {
      pushMatrix();
      translate(i*patternThingX, j*patternThingY);
      yourSecond();
      popMatrix();
    }
  }


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


  fill(random(0,255),random(0,255),random(0,255),10);
  strokeWeight(3);
  rect(random(0,5),random(0,5),random(0,5),50);
 
}
void yourSecond() {
  fill(255);
  ellipse(25,25,random(5,50),random(5,50));
  noFill();
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


