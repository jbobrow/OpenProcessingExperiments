
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,500);
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(0);
  noStroke();
  rect(0,0,500,500);
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  smooth();
  
  for(int i = 0; i < width/patternSeperationX+1; i++){
      for(int j = 0; j < height/patternSeperationY+1; j++){
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
  
  color from = color(170,10,15);
  color to = color(55,2,110);
  color intA = lerpColor(from,to,.2);
  color intB = lerpColor(from,to,.4);
  color intC = lerpColor(from,to,.6);
  color intD = lerpColor(from,to,.8);
  noFill();
  stroke(from);
  ellipse(40,40,40,40);
  stroke(intA);
  ellipse(45,45,55,55);
  stroke(intB);
  ellipse(50,50,70,70);
  stroke(intC);
  ellipse(55,55,85,85);
  stroke(intD);
  ellipse(60,60,100,100);
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

