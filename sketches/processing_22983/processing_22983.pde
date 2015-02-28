
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 50;
int patternSeperationY = 50;
int a = 10;
 
 
void setup(){
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
 smooth();  
 strokeWeight(1);
 
 stroke(0,0,200,random(255));
 fill(255, random(200));
 ellipse(a,a,2*a,2*a);
 ellipse(2*a,2*a,3*a,3*a);
 ellipse(3*a,3*a,4*a,4*a);
 ellipse(4*a,4*a,5*a,5*a);
 ellipse(5*a,5*a,6*a,6*a);
 
 
 
 fill(50, 50, 200, random(150));
 noStroke();
 ellipse(0,0,100,100);
 stroke(0, random(1000));
 line(0,0,100,0);
 line(0,0,0,100);
 line(0,25,50,25);
 line(25,0,25,50);
 strokeWeight(1);
 stroke(255, random(255));
 line(a,0,a,50);
 line(2*a,0,2*a,50);
 line(3*a,0,3*a,50);
 line(4*a,0,4*a,50);
 line(5*a,0,5*a,50);
 
 line(0,a,50,a);
 line(0,2*a,50,2*a);
 line(0,3*a,50,3*a);
 line(0,4*a,50,4*a);
 line(0,5*a,50,5*a);
}
 


