
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  smooth();
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
  float xa = random(0,100);
  float ya = random(0,100);
  noFill();
  bezier(xa, ya, 10, 10, 90, 90, 50, 100);
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(xa+5,ya,20,20);
  ellipse(xa,ya+5,20,20);
  ellipse(xa-5,ya,20,20);
  ellipse(xa,ya-5,20,20);
  fill(255);
  ellipse(xa,ya,20,20);
  ellipse(xa-4, ya-2, 5, 5);
  ellipse(xa+4, ya-2, 5, 5);
  ellipse(xa-4, ya-3, 2, 2);
  ellipse(xa+4, ya-3, 2, 2);
  bezier(xa-4,ya+4,xa-4,ya+6,xa+4,ya+6,xa+4,ya+4);
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

