
//Alex Polglase
 
//Check PDf EXPORT on processing.org
  
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 10;
int patternSeperationY = 10;
  
float position = 1.001;
float trans = 255;
 
void setup(){
  size(800,400);
background (255);
    
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
    
  noStroke ();
  fill (random (232,250),random (1,23), random (2, 40), random (10, trans));
  rect (random (0,position),random (0,position),33,33);
  position = position * 1.001;
  trans = trans - 0.1;
}
  
 
   
  

