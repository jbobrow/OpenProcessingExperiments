
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
  background(#6556BF);
   
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
  
  strokeWeight(16); 
  stroke(#1AA08F);
  line(0,0,100,100);
  
  strokeWeight(16); 
  stroke(#3F7BA7);
  line(40,0,100,60);  
  
  strokeWeight(16); 
  stroke(#3F7BA7);
  line(0,40,60,100);
 
  strokeWeight(16); 
  stroke(#1AA08F);
  line(0,92,8,100);
  
  strokeWeight(16); 
  stroke(#1AA08F);
  line(92,0,100,8);
  
   
   
   
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


