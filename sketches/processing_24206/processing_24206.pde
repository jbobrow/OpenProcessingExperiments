
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 200;
int patternSeperationY = 200;
 

void setup(){
  size(600,600);
  background(240,240,240);
   smooth();
  //the white box simply shows you the space your pattern gets drawn in
  fill(240,240,240);
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
   
//outside arcs
fill(210,210,210);
arc(50,0,100,100,0,PI);
arc(0,150,100,100,-PI/2,PI/2);
arc(150,200,100,100,PI,2*PI);
arc(200,50,100,100,PI/2,3*PI/2);
//inside arcs
fill(230,230,230);
arc(50,100,100,100,PI,2*PI);
arc(100,150,100,100,PI/2,3*PI/2);   
arc(150,100,100,100,0,PI);
arc(100,50,100,100,-PI/2,PI/2);
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


