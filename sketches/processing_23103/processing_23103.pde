
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
 
 
void setup(){
  size(500,500);
  
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(random(0,255),random(0,255),random(0,255));
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
fill(random(0,255),random(0,255),random(0,255));
rect(0,0,100,100);
smooth();
stroke(random(0,255),random(0,255),random(0,255));
strokeWeight(random(0,3));
 
 translate(random(0,50),random(0,50));
 
line(0,25,50,100);
line(100,25,50,100);

line(0,25,20,0);
line(80,0,100,25);

line(20,0,80,0);
line(0,25,100,25);

line(20,0,33,25);
line(33,25,50,0);
line(50,0,66,25);
line(66,25,80,0);

line(33,25,50,100);
line(50,100,66,25);
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

