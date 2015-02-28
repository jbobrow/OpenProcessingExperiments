
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;

 
void setup(){
  size(500,500);
  background(29,122,131);
  smooth();
   
  //the white box simply shows you the space your pattern gets drawn in
  noFill();
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
  
  stroke(0);
  fill(29,30,62);
  bezier(0,0,0,100,0,100,100,100);
  bezier(0,0,80,0,100,20,100,100);
  noFill();
  stroke(30,35,129);
  bezier(0,0,0,90,10,100,100,100);
  stroke(29,61,129);
  bezier(0,0,0,80,20,100,100,100);
  stroke(21,91,129);
  bezier(0,0,0,70,30,100,100,100);
  stroke(29,122,131);
  bezier(0,0,0,60,40,100,100,100);
  stroke(183);
  fill(29,122,131);
  ellipse(40,60,15,15);
  fill(29,30,62);
  noStroke();
  quad(1,2,99,100,100,99,2,1);
 

  
  
 
 
  
  
  
   
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


