
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 50;
int patternSeperationY = 50;


void setup(){
  size(500,500);
  smooth();
  //the white box simply shows you the space your pattern gets drawn in
  fill(0, 85, 251);
  background(0, 85, 251);
  
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);

  for(int i = 0; i < 500/patternSeperationX; i++){
      for(int j = 0; j < 500/patternSeperationY; j++){
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
colorMode(RGB, 100);
for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    stroke(i, j, 100);
    point(i, j);
  }
}

 
  fill(255, 228, 139);
  noStroke();
  triangle(0, 40, 15, 10, 30, 40);
  
  noFill();
  stroke(0);
  triangle(20, 10, 35, 40, 50, 10);
  
  stroke(255, 255, 255);
  ellipse(35, 20, 10, 10);
  fill(0);
  ellipse(35, 20, 5, 5);
  
  fill(255, 255, 255);
  ellipse(3, 5, 3, 3);
  ellipse(10, 5, 3, 3);
  ellipse(17, 5, 3, 3);
  ellipse(24, 5, 3, 3);
  ellipse(31, 5, 3, 3);
  ellipse(38, 5, 3, 3);
  ellipse(45, 5, 3, 3);

  fill(0);
  noStroke();
  ellipse(3, 45, 4, 4);
  ellipse(10, 45, 4, 4);
  ellipse(17, 45, 4, 4);
  ellipse(24, 45, 4, 4);
  ellipse(31, 45, 4, 4);
  ellipse(38, 45, 4, 4);
  ellipse(45, 45, 4, 4);
 
  
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

