
int patternSeperationX = 100;
int patternSeperationY = 100;
 
 
void setup(){
  size(500,500);
  smooth();
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
   background(51);
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

}
 
 
void yourFunction(){
   
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)

 

 strokeWeight(10);
 stroke(255);
 noFill();
 rect(0,0,100,100);
 
}
 

                
