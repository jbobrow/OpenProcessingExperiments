
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


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

fill(1); 
noStroke();
rect(0,0,100,100);
noFill();
stroke(55);
ellipse(50,50,190,100);
ellipse(50,50,100,190);
noFill();
stroke(100);
ellipse(50,50,170,80);
ellipse(50,50,80,170);
noFill();
stroke(140);
ellipse(50,50,150,60);
ellipse(50,50,60,150);
noFill();
stroke(180);
ellipse(50,50,130,40);
ellipse(50,50,40,130);
noFill();
stroke(210);
ellipse(50,50,110,20);
ellipse(50,50,20,110);
noFill();
stroke(230);
ellipse(50,50,90,0);
ellipse(50,50,0,90);
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

