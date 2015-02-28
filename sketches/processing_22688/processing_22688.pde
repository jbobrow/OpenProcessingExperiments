
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
  stroke(255);
   
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
fill(255,0,0,100);  
triangle(0,50,25,0,50,50);
stroke(255,0,0);
triangle(5,40,30,5,50,50);
stroke(255,33,33);
triangle(10,35,35,10,50,50);
stroke(255,66,66);
triangle(15,30,40,15,50,50);
stroke(255,99,99);
triangle(20,25,45,20,50,50);
stroke(255,132,132);
triangle(25,20,50,25,50,50);
stroke(255,165,165);
triangle(30,15,55,30,50,50);
stroke(255,198,198);
triangle(35,10,60,35,50,50);
stroke(255,231,231);
triangle(40,5,65,40,50,50);
stroke(255,255,255);
triangle(45,0,70,45,50,50);
triangle(50,-5,75,50,50,50);
   
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


