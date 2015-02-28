
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
 fill(250,250,250);
rect(0,0,500,500);
fill(26,62,80);
ellipse(12.5,12.5,25,25);
ellipse(87.5,12.5,25,25);
  fill(39,94,121);
ellipse(25,25,25,25);
ellipse(75,25,25,25);
  fill(52,130,167);
ellipse(37.5,37.5,25,25);
ellipse(62.5,37.5,25,25);
  fill(68,178,232);
ellipse(50,50,25,25);
ellipse(50,50,25,25);


fill(26,62,80);
ellipse(87.5,87.5,25,25); 
ellipse(12.5,87.5,25,25);
 fill(39,94,121);
ellipse(75,75,25,25); 
ellipse(25,75,25,25);
   fill(52,130,167);
ellipse(62.5,62.5,25,25);
ellipse(37.5,62.5,25,25);
 fill(68,178,232);
ellipse(50,50,25,25);
ellipse(50,50,25,25);
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

