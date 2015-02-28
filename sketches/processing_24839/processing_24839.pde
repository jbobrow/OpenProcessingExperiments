
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 50;
int patternSeperationY = 50;


void setup(){
  size(500,500);
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(500);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  
 for(int i = 0; i < (width/patternSeperationX)+25; i++){
      for(int j = 0; j < (height/patternSeperationY)+25; j++){
        pushMatrix();
        translate((i*patternSeperationX)-26, (j*patternSeperationY)-26);
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

fill(100);
 rect(0,0,50,50);
fill(180);
 rect(0,0,12,12);
fill(180);
 rect(20,20,12,12);
fill(180);
 rect(38,38,12,12);
fill(180);
 rect(38,0,12,12);
fill(180);
 rect(0,38,12,12);
 rect(12,0,6,6);
 rect(0,12,6,6);
 rect(32,0,6,6);
 rect(0,32,6,6);
 rect(44,12,6,6);
 rect(12,44,6,6);
 rect(44,32,6,6);
 rect(32,44,6,6);
 rect(23,17,6,3);
 rect(17,23,3,6);
 rect(32,23,3,6);
 rect(23,32,6,3);
 
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

