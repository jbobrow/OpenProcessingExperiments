
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
  background(250,252,196);
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
stroke(136,136,136);
strokeWeight(2);
line(0,0,500,500);
stroke(252,204,82);
line(0,0,500,500);

fill(255);
stroke(196,196,196);
ellipse ( 25,25,25,25);
stroke(196,196,196);
fill(250,252,196);
ellipse(35,35,35,35);
fill(255);
ellipse ( 35,35,25,25);
fill(206,206,206);
ellipse(35,35,15,15);
fill(250,252,196);
ellipse(15,15,25,25);
fill(255);
ellipse(15,15,15,15);
fill(206,206,206);
ellipse(15,15,5,5);
line(15,15,35,35);
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

