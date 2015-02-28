
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
  
  
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 50;
int patternSeperationY = 50;
 
  
void setup(){
  size(600,600);
    
  //the white box simply shows you the space your pattern gets drawn in
background(0);
  fill(0);
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
//line(0,50,50,50);
//stroke(245,12,12);
//curve(0,0,20,3,30,7,50,20);
stroke(12,175,247);
ellipse(40,40,40,40);
stroke(30,190,247);
arc(50,55,50,50,0,PI/2);
stroke(50,210,247);
arc(100,100,100,100,0,PI/2);
 
    
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

