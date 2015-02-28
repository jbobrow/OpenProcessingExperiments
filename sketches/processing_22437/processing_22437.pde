
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 80;
int patternSeperationY = 80;


void setup(){
  size(500,500);
  smooth();

  
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
  
 
  fill(50,50,50);
  rect(0, 0, 500, 500);
  fill(5,5,5);
  rect(15, 15, 55, 55);
  fill(240, 211, 46);
  ellipse(56, 46, 55, 55);
  fill(196, 33, 0);
  ellipse(50, 40, 45, 45);
  fill(252,251,201);
  ellipse(15,15,20,20);
  
  fill(5,5,5);
  bezierDetail(1);
  bezier(85, 20, 10, 10, 90, 90, 15, 80); 
  stroke(126);
  bezierDetail(3);
  bezier(85, 20, 10, 10, 90, 90, 15, 80);
  stroke(255);
  bezierDetail(12);
  bezier(85, 20, 10, 10, 90, 90, 15, 80);
  
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

