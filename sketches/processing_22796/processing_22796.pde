
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 500;
int patternSeperationY = 500;
 
 
void setup(){
  size(500,500);
   
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
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
  
smooth();
stroke(255,235,135);  
fill(255,235,135);
rect(0,0,500,500);
strokeWeight(6);

stroke(0,0,0);

fill(0);
arc(80,225,50,50,0,100);
arc(420,225,50,50,0,100);

fill(255,0,0);
beginShape();
curveVertex(500,0);
curveVertex(130,300);
curveVertex(250,425);
curveVertex(370,300);
curveVertex(0,0);
endShape();

stroke(255,255,255);
line(140,300,360,300);

stroke(255,160,190,0);
fill(255,160,190,70);
arc(50,280,60,20,0,100);
arc(450,280,60,20,0,100);

fill(255,235,135);
stroke(255,235,135);
arc(70,255,55,15,0,100);
arc(430,255,55,15,0,100);

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

