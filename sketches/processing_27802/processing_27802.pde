
     
                
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

noStroke();
fill(13, 12, 12, 200);
rect(0, 0, 100, 100);
fill(255, 100);
triangle(20, 65, 48, 10, 76, 65);
fill(13, 12, 12, 90);
triangle(10, 55, 38, 0, 66, 55);
fill(255, 100);
triangle(0, 45, 28, -10, 56, 45);
fill(13, 12, 12, 70);
triangle(-10, 35, 18, -20, 46, 35);
fill(255, 70);
triangle(-20, 25, 8, -30, 36, 25);
fill(13, 12, 12, 60);
triangle(-30, 15, -2, -40, 26, 15);
fill(13, 12, 12);
triangle(30, 75, 58, 20, 86, 75);
fill(255, 100);
triangle(40, 85, 68, 30, 96, 85);
fill(13, 12, 12, 90);
triangle(50, 95, 78, 40, 106, 95);
fill(255, 80);
triangle(60, 105, 88, 50, 116, 105);


 
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
