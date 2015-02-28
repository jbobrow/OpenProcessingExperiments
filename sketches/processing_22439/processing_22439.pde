
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


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
  
  triangle(0,0,50,50,0,100);
triangle(0,0,45,50,0,100);
triangle(0,0,40,50,0,100);
triangle(0,0,35,50,0,100);
triangle(0,0,30,50,0,100);
triangle(0,0,50,50,100,0);
triangle(0,0,50,45,100,0);
triangle(0,0,50,40,100,0);
triangle(0,0,50,35,100,0);
triangle(0,0,50,30,100,0);
triangle(100,0,50,50,100,100);
triangle(100,0,55,50,100,100);
triangle(100,0,60,50,100,100);
triangle(100,0,65,50,100,100);
triangle(100,0,70,50,100,100);
triangle(0,100,50,50,100,100);
triangle(0,100,50,55,100,100);
triangle(0,100,50,60,100,100);
triangle(0,100,50,65,100,100);
triangle(0,100,50,70,100,100);
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

