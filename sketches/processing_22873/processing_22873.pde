
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
  
  fill(190, 24, 0, 100);
  noStroke();
  ellipse(25, 25, 100,100);
  stroke(0);
  line(0,0,50,50);
  line(0,50,50,0);
  fill(30, 50, 0);
  ellipse(25, 25, 20, 20);
  fill(251, 120, 0);
  ellipse(10, 10, 5, 5);
  ellipse(40, 40, 5, 5);
  ellipse(10, 40, 5, 5);
   ellipse(40, 10, 5, 5);
   fill(40, 170, 0, 80);
  noStroke();
  ellipse(25, 25, 50, 50);

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

