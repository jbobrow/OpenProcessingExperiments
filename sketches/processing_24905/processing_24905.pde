


///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 50;
int patternSeperationY = 50;


void setup(){
  size(300,600);
 
  smooth();
  noFill();
  background(#3D3D3D);
  
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
 stroke(#CC1991);
 
line(0,0,50,50);
line(50,0,0,50);

  strokeWeight(1.5);
line(0,0,15,25);
line(0,50,15,25);
line(50,0,35,25);
line(50,50,35,25);
stroke(#E31EA1);
line(0,10,10,25);
line(0,40,10,25);
line(50,10,40,25);
line(50,40,40,25);



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

