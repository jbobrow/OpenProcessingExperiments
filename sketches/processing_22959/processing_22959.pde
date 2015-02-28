
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 70;
int patternSeperationY = 70;


void setup(){
  size(500,500);
 
  //the white box simply shows you the space your pattern gets drawn in
 fill(255);
 background(255);
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
  
noFill();
ellipse(0, 0,200,200);
ellipse(0, 0,250,250);
noFill();
noFill();
ellipse(0, 0,300,300);
ellipse(0, 0,350,350);
noFill();
ellipse(0,0,400,400);
ellipse(0,0,450,450);
noFill();
ellipse(0,0,600,600);
ellipse(0,0,650,650);
noFill();
ellipse(0,0,800,800);
ellipse(0,0,850,850);
noFill();
ellipse(0, 0,900,900);
ellipse(0, 0,950,950);
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

