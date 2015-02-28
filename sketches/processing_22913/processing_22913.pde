
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 30;
int patternSeperationY = 30;


void setup(){
  size(500,500);
  smooth();
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  background(36,19,234);
  //rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  
  for(int i = -1; i < width/patternSeperationX; i++){
      for(int j = -1; j < height/patternSeperationY; j++){
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
  strokeWeight(10);
  stroke(41,39,62,92);
  line(12,12,60,60);
  stroke(28,28,28,50);
  line(0,60,60,0);
  stroke(242,12,227,40);
  line(25,10,25,100);
  fill(242,197,12,50);
  ellipse(31,31,50,50);
  
}
 
//-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  




void keyPressed() {
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}

