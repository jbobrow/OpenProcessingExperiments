
//////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
 
 
void setup(){
smooth () ; 
  size(500,500);
   
 background (0,0,150); 
   
  //the white box simply shows you the space your pattern gets drawn in
  fill(0,0,150);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  
  //background(50,50,250);
   
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
   
//background (50,100,250) ;


//ellipse (25,25,50,50) ;
//ellipse (75,25,50,50) ;
//ellipse (75,75,50,50) ;
///ellipse (75,25,50,50) ;


//stroke (random(0,255),random(0,255),random(0,255));
fill (0,0,150); 


strokeWeight(1);
fill(0,0,150);
rect (random(0,100),random(0,100),random(0,50),random(0,50));
rect (random(0,100),random(0,100),random(0,50),random(0,50));
rect (random(0,100),random(0,100),random(0,50),random(0,50));
rect (random(0,100),random(0,100),random(0,50),random(0,50));
rect (random(0,100),random(0,100),random(0,50),random(0,50));
rect (random(0,100),random(0,100),random(0,50),random(0,50));
rect (random(0,100),random(0,100),random(0,50),random(0,50));
rect (random(0,100),random(0,100),random(0,50),random(0,50));
rect (random(0,100),random(0,100),random(0,50),random(0,50));
rect (random(0,100),random(0,100),random(0,50),random(0,50));



rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));




fill(75,0,75);




rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));



fill(150,0,0);



rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));


fill(0,150,0);




rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));


fill(0,0,150);


rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));


fill(150,150,0);


rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

fill(150,0,0);


rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

fill(200,100,0);



rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));


fill(0,150,150);



rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));
rect (random(0,500),random(0,500),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));


fill(150,0,150);


rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

fill(200,100,0);


rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));

fill(0,0,150);

rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));
rect (random(0,250),random(0,250),random(0,50),random(0,50));







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


