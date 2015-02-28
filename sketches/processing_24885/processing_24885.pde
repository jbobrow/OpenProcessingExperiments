

///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(250,500);

  smooth();
  
  
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  //rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
        noStroke();
        
      }
  }
  scale(.5);
}


void draw()
{
  //This is here so the program keeps running and the screengrab will work
}


void yourFunction(){
  
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)

 int circle = 0;
 noStroke();
    fill (255,120, 48, 5);
    while (circle<500) {
      ellipse (0,0,circle, circle);
      circle = circle +20;
    }
    fill(255,13,203,20);
    while (circle<200);{
      ellipse (0,0,circle,circle);
      circle = circle +5;
    }
    fill(13,229,255, 30);
    while (circle<100);{
      ellipse (0,0,circle,circle);
      circle = circle +5;
    }
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

