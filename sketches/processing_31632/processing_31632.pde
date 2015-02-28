
int patternSeperationX = 90;
int patternSeperationY = 90;
   
float position = 1.001;
float trans = 255;
  
void setup(){
  size(500,500);
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
  fill (random (232,250),random (1,23), random (2, 40), random (1, trans));
  triangle (random(225,500),random (0,250),random (0,250),random(0,500),250,0);
  smooth();
  position = position * 1.001;
  trans = trans - 0.1;
}


