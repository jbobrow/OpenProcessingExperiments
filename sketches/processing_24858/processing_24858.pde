

/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 35;
int patternSeperationY = 35;
 
 
void setup(){
smooth () ; 
 background(255);
  size(500,1000);


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
   
//background (50,100,250) ;

fill (255) ;
// edging of circle, "frill"//
noStroke();
fill(0);
ellipse(25,25,60,60);
fill(255);
ellipse(25,25,50,50);
ellipse (37,4,6,6);
ellipse (42,8,6,6);
ellipse (8,7,6,6);
ellipse (13,3,6,6);
ellipse(25,0,6,6);
ellipse(19,1,6,6);
ellipse(31,1,6,6);
ellipse (4,12,6,6);
ellipse(1,17,6,6);
ellipse (0,23,6,6);
ellipse (1,28,6,6);
ellipse (2,33,6,6);
ellipse (5,38,6,6);
ellipse(25,50,6,6);
ellipse(22,48,6,6);

// black insides//
fill(0);
ellipse(25,0,4,4);
triangle(23,0,27,0,25,25);
ellipse(19,1,4,4);
triangle(17,1,21,1,25,25);
ellipse (37,4,4,4);
triangle(35,4,39,4.75,25,25);
ellipse (42,8,4,4);
triangle(40,7.7,43.85,9,25,25);
ellipse (8,7,4,4);
triangle(9,5.25,7,8.75,25,25);
ellipse (13,3,4,4);
triangle(10.95,3.5,15.05,2.5,25,25);
ellipse(31,1,4,4);
triangle(29,1,33,1,25,25);
ellipse (4,12,4,4);
triangle(3.5,14,4.5,10,25,25);
ellipse(1,17,4,4);
triangle(1.5,15,1,19,25,25);
ellipse (0,23,4,4);
triangle(0,21,0,25,25,25);
ellipse (1,28,4,4);
triangle(1,26,1,30,25,25);
ellipse (2,33,4,4);
triangle(2.75,35,1.5,31,25,25);
ellipse (5,38,4,4);
triangle (5,36,5.25,40,25,25);
ellipse(45,13,4,4);
triangle(44,11,45,15,25,25);
triangle (46,17,46,20,25,25);
triangle (46,22,46,25,25,25);
triangle (46,26,46,29,25,25);
triangle (46,31,45,34,25,25);
triangle(46,36,44,38,25,25);
triangle(25,25,27,37,23,37);
triangle(25,25,30,37,37,37);
triangle(25,25,20,37,17,37);
    
fill(180);
ellipse(25,25,4,4);
 fill(255);
ellipse(25,25,2,2);

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

                
                                
