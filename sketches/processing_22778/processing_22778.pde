
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
 int patternSeperationX = 50;
 int patternSeperationY = 50;


void setup(){
  size(500,500);
  background(255);
  
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
  smooth();
  stroke(0);
  fill(0);
  line(0,0,50,50);
  line(0,5,50,45);
   line(0,10,50,40);
   line(0,15,50,35);
   line(0,20,50,30);
   line(0,25,50,25);
   line(0,30,50,20);
   line(0,35,50,15);
   line(0,40,50,10);
   line(0,45,50,5);
   line(0,50,50,0);
 
  
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

