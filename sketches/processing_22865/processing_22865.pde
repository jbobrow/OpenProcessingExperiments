
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,500);
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(190);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0, 150);
  strokeWeight(1.5);
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
  
 
  line(0,0,100,100);
  line(0,0,100,80);
  line(0, 0, 100, 60);
  line(0, 0, 100, 40);
  line(0, 0, 100, 20);
  line(0, 0, 100, 0);

  line(0,20,100,0);
  line(0,40,100,0);
  line(0,60,100,0);
  line(0,80,100,0);
line(0,100,100,0);


ellipse(50, 100, 50, 50);


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

