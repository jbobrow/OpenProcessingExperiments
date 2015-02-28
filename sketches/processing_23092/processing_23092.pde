
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
 
 
void setup(){
  background(0); 
  size(500,500);
  
  
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


/*arc(50, 50, 100, 100, 0, PI);
arc(0, 0, 100, 100, 0, PI);
arc(100, 0, 100, 100, 0, PI);
*/


smooth();
int x;
for(x = 100; x > 0; x=x-10)
{
  noFill();
  strokeWeight(2);
  stroke(255,random(0,60));
arc(50, 50, x+20, x+20, 0, PI);
arc(0, 0, x, x, 0, PI);
arc(100, 0, x, x, 0, PI);
ellipse(50,50,x,x);


}


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

