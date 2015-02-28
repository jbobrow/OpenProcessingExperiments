
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 50;
int patternSeperationY =50;


void setup(){
  background(50,150,50);
  size(500,500);
  
  //the white box simply shows you the space your pattern gets drawn in
  //fill(255);
  //noStroke();
  //rect(0,0,patternSeperationX,patternSeperationY);
  //stroke(0);
  
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
  stroke(0);
  strokeWeight(1); 
  line(25,0,25,50);  
  line(0,25,50,25);
  strokeWeight(3);
  line(50,0,50,50);  
  line(0,50,50,50);
  strokeWeight(1);
  stroke(150,50,50);
  line(25,0,50,25);
  line(0,25,25,50);
  line(25,0,0,25);
  line(25,50,50,25);
  line(23,50,50,23);
  line(2,25,27,50);
  line(25,2,2,25);
  line(25,2,48,25);
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

