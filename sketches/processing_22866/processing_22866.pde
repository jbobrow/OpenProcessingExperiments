
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 10;
int patternSeperationY = 10;
 
 
void setup(){
  size(500,500);
   
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  
  fill(0,20);
  ellipse(250,250,250,250);
  ellipse(100,100,250,250);
  ellipse(400,400,250,250);
  ellipse(100,400,250,250);
  ellipse(400,100,250,250);
  rect(200,200,100,100);
  rect(150,150,200,200);
  ellipse(250,250,100,100);
  ellipse(250,250,50,50);
  ellipse(250,250,25,25);
  ellipse(250,250,15,15);
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
 
  
  
  strokeWeight(10);
  stroke(0,random(0,10));
  ellipse(0,0,10,10);
  
   
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


