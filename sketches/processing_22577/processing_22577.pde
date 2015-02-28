
//////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
 
 
void setup(){
smooth () ; 
  size(500,500);
   
 background (0); 
   
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
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
fill(0);
rect (0,0,100,100);

//stroke (random(0,255),random(0,255),random(0,255));
strokeWeight(1);
line (100,0,0,100);
stroke (random(0,255),random(0,255),random(0,255));
line (50,0,50,100);
stroke (random(0,255),random(0,255),random(0,255));
line (0,0,100,100);
stroke (random(0,255),random(0,255),random(0,255));
line (0,50,100,50);
stroke (random(0,255),random(0,255),random(0,255));
line (0,100,100,0);
stroke (random(0,255),random(0,255),random(0,255));
line (0,25,100,25);
stroke (random(0,255),random(0,255),random(0,255));
line (0,75,100,75);
stroke (random(0,255),random(0,255),random(0,255));
line (25,0,25,100);
stroke (random(0,255),random(0,255),random(0,255));
line (25,0,100,75);
stroke (random(0,255),random(0,255),random(0,255));
line (50,0,100,50);
stroke (random(0,255),random(0,255),random(0,255));
line (75,0,100,25);
stroke (random(0,255),random(0,255),random(0,255));
line (0,25,75,100);
stroke (random(0,255),random(0,255),random(0,255));
line (0,50,50,100);
stroke (random(0,255),random(0,255),random(0,255));
line (0,75,25,100);
stroke (random(0,255),random(0,255),random(0,255));
line (0,75,25,100);
stroke (random(0,255),random(0,255),random(0,255));
line (25,0,0,25);
stroke (random(0,255),random(0,255),random(0,255));
line (50,0,0,50);
stroke (random(0,255),random(0,255),random(0,255));
line (75,0,0,75);
stroke (random(0,255),random(0,255),random(0,255));
line (100,0,0,100);
stroke (random(0,255),random(0,255),random(0,255));
line (75,100,100,75);
stroke (random(0,255),random(0,255),random(0,255));
line (50,100,100,50);
stroke (random(0,255),random(0,255),random(0,255));
line (25,100,100,25);
stroke (random(0,255),random(0,255),random(0,255));
line (75,0,75,100);







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


