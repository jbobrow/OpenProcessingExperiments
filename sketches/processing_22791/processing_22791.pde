
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
 int patternSeperationX = 30;
 int patternSeperationY = 30;


void setup(){
  size(700,700);
  background(0);
  
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
  stroke(255);
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
   line(5,0,45,50);
   line(10,0,40,50);
   line(15,0,35,50);
   line(20,0,30,50);
   line(25,0,25,50);
   line(30,0,20,50);
   line(35,0,15,50);
   line(40,0,10,50);
   line(45,0,5,50);
 
  
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

