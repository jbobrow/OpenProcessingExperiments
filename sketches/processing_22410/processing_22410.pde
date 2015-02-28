
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
smooth () ;  
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
  
//background (50,100,250) ;
fill (250,0,0) ;
ellipse (100,100,200,200) ;
fill (230,0,0) ;
ellipse (100,100,190,190) ;
fill (210,0,0) ;
ellipse (100,100,180,180) ;
fill (190,0,0) ;
ellipse (100,100,170,170) ;
fill (170,0,0) ;
ellipse (100,100,160,160) ;
fill (150,0,0) ;
ellipse (100,100,150,150) ;
fill (130,0,0) ;
ellipse (100,100,140,140) ;
fill (110,0,0) ;
ellipse (100,100,130,130) ;
fill (90,0,0) ;
ellipse (100,100,120,120) ;
fill (80,0,0) ;
ellipse (100,100,110,110) ;
fill (70,0,0) ;
ellipse (100,100,100,100) ;
fill (60,0,0) ;
ellipse (100,100,90,90) ;
fill (50,0,0) ;
ellipse (100,100,80,80) ;
fill (40,0,0) ;
ellipse (100,100,70,70) ;
fill (30,0,0) ;
ellipse (100,100,60,60) ;
fill (20,0,0) ;
ellipse (100,100,50,50) ;
fill (10,0,0) ;
ellipse (100,100,40,40) ;
fill (0,0,0) ;
ellipse (100,100,10,10) ;
fill (0,0,10) ;
ellipse (100,100,20,20) ;
fill (0,0,20) ;
ellipse (100,100,30,30) ;



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

