
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,500);
  smooth();
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  background(255);
  
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
  strokeWeight(3);
  // vert
  line(0,0,0,17);
  line(50,0,50,17);
  line(0,83,0,100);
  line(50,83,50,100);
  line(25,33,25,67);
  line(75,33,75,67);
  //diag
  line(0,17,25,33);
  line(25,33,50,17);
  line(50,17,75,33);
  line(75,33,100,17);
  line(0,83,25,67);
  line(25,67,50,83);
  line(50,83,75,67);
  line(75,67,100,83);
  
  //inner lines
  strokeWeight(1);
  line(5,0,5,14);
  line(5,14,25,27);
  line(45,0,45,14);
  line(25,27,45,14);
  
  line(55,0,55,14);
  line(55,14,75,27);
  line(95,0,95,14);
  line(75,27,95,14);
  
  line(0,23,20,36);
  line(20,36,20,63);
  line(20,63,0,76);
  
  line(50,23,30,36);
  line(30,36,30,63);
  line(30,63,50,76);
  
  line(50,23,70,36);
  line(70,36,70,63);
  line(70,63,50,76);
  
  line(100,23,80,36);
  line(80,36,80,63);
  line(80,63,100,76);
  
  line(5,100,5,86);
  line(5,86,25,73);
  line(45,100,45,86);
  line(25,73,45,86);
  
  line(55,100,55,86);
  line(55,86,75,73);
  line(95,100,95,86);
  line(75,73,95,86);
  
  
  
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

