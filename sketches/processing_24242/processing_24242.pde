
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//import processing.pdf.*;


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 60;
int patternSeperationY = 50;

void setup(){
  size(200,400);
  smooth();
//  beginRecord(PDF, "104.pdf"); 
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  
  for(int i = -1; i <= width/patternSeperationX; i++){
      for(int j = -1; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
//endRecord();

}


void draw()
{
  //This is here so the program keeps running and the screengrab will work
}


void yourFunction(){
  
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
 fill(0,15);
 for (int i = 25; i <55; i = i+5)
  triangle(0,0,i,50,0,100);
  
   for (int i = 25; i <55; i = i+5)
  triangle(0,0,50,i,100,0);

for (int i = 50; i <75; i = i+5)
triangle(0,100,50,i,100,100);

for (int i = 50; i <75; i = i+5)
triangle(100,0,i,50,100,100);

for (int i = 25; i <55; i = i+5)
triangle(0,50,50,i,100,50);

for (int i = 55; i <75; i = i+5)
triangle(0,50,50,i,100,50);

for (int i = 50; i <75; i = i+5)
triangle(50,0,i,50,50,100);

for (int i = 25; i <75; i = i+5)
triangle(50,0,i,50,50,100);



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

