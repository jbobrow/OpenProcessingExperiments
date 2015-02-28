
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 50;
int patternSeperationY = 50;


void setup(){
  size(500,500);
  
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
  smooth();
  stroke (255, 255, 0);
  ellipse(250,250,250,250);
  stroke (210, 150, 0);
  ellipse(250,250,245,245);
  stroke (255, 10, 0);
  ellipse(250,250,240,240);
  stroke (150, 10, 0);
  ellipse(250,250,235,235);
  //centre dot//
  line(50, 50, 50, 50);
  //red line across//
  line(30, 30, 500, 0);
  //red line down//
  line(30, 500, 30, 0);
  //white lines down diagonal//
  stroke (55, 255, 255);
  line(0, 30, 500, 600);
  //blue lines down//
  stroke (0, 0, 255);
  line(0, 30, 30, 500);
  stroke (100, 10, 0);
  ellipse(50,50,5,5);
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

