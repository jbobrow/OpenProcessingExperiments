
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
  background(235,255,188);
  smooth();


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
noStroke();
  fill(RGB,100);
  quad(0, 0, 50, 25, 30, 30, 25, 50);
  quad(70, 70, 50, 75, 100, 100, 75, 50);
  quad(0, 100, 25, 50, 30, 70, 50, 75);
  quad(100, 0, 50, 25, 70, 30, 75, 50);
noStroke();
ellipse(25,25,50,50)  ;
fill(255);
ellipse(25,25,50,50)  ;
fill(216,252,133);
ellipse(25,25,45,45);
fill(201,252,130);
ellipse(25,25,30,30);

  
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

