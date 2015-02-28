
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,500);
  smooth();
  
  //the white box simply shows you the space your pattern gets drawn in
  
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  background(255);
  
  for(int i = 0; i < width/patternSeperationX + 1; i++){
      for(int j = 0; j < height/patternSeperationY +1; j++){
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



arc(0, 0, 200, 200, TWO_PI-PI/2, TWO_PI); 
arc(0, 0, 200, 200, PI/2, PI);

arc(100, 0, 200, 200, TWO_PI-PI/2, 0);
noFill();
fill(0, 255, 200);
ellipse(50, 50, 50, 50);
fill(0, 200, 255);
ellipse(50, 50, 20, 20);
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

