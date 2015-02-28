
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 50;
int patternSeperationY = 50;


void setup(){
  size(500,500);
  
  //the white box simply shows you the space your pattern gets drawn in
 { fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  background(252,255,113);
  noStroke();
rect(0,0,50,50,100,100);
}
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
noStroke();
fill(255);
ellipse(25,25,25,25);
fill(126,10,14,150);
ellipse(25,25,10,40);
fill(126,10,14,80);
ellipse(25,25,30,10);
fill(126,10,14,60);
ellipse(25,25,40,10);
fill(0,0,0);
ellipse(25,25,10,10);
fill(255);
ellipse(25,25,5,5);
  fill(RGB,100);
  stroke(255,0,0,10);
  quad(0, 0, 50, 25, 30, 30, 25, 50);
  quad(70, 70, 50, 75, 100, 100, 75, 50);
  quad(0, 100, 25, 50, 30, 70, 50, 75);
  quad(100, 0, 50, 25, 70, 30, 75, 50);
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

