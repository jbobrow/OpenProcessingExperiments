
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
  
  
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 50;
int patternSeperationY = 50;
 
  
void setup(){
  size(600,600);
    
  //the white box simply shows you the space your pattern gets drawn in
background(157,240,255);
  fill(157,240,255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(255);
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
  fill(29,148,170);
  
rect(5,5,40,40);
rect(0,0,20,20);
rect(50,0,-20,20);
rect(50,50,-20,-20);
rect(0,50,20,-20);
noStroke();
fill(250,148,170,100);
rect(10,10,30,30);
stroke(255);
noFill();
ellipse(25,25,50,50);
 
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


