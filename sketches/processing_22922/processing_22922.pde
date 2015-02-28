
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 20;
int patternSeperationY = 20;


void setup(){
  size(500,500);
  background(255,255,255);
  smooth();
 
  //the white box simply shows you the space your pattern gets drawn in
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
 
  noStroke();
  fill(random(0,100),random(0,100),random(0,100),random(0,100));
  quad(0,0,5,0,0,5,5,5);
  triangle(2.5,0,5,5,0,5);

}

//  55 27.5 18.75
 
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

