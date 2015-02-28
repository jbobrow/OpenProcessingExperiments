
// import processing.pdf.*;
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
  
  
//what happens if you change these both to 50? what are they doing to the pattern?
float patternSeperationX = 95;
float patternSeperationY = 95;
  
  
void setup(){

  size(400,800);
//  beginRecord(PDF, "fadies.pdf");
    background(0);
   
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
    //endRecord();
    
}
  
  
void draw()
{
  //This is here so the program keeps running and the screengrab will work
}
  
  
void yourFunction(){
    
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
smooth();

//strokeWeight(1);
float c = 100;
float a = 1;
float b = random(0.5,2);
float r = random(115,195);
for(float s=0 ; s<=200 ; s=s+10)

{
 color from= color(#070834);
color to = color(#90FFEA);
color fade = lerpColor(from,to,a); 
  a=a-0.055;
  c=c-15;
 
 strokeWeight(b);
 stroke(fade,c);
ellipse(50,50,r,s);



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

