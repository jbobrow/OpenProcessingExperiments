
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
  smooth();
  
  for(int i = 0; i < width/patternSeperationX+1; i++){
      for(int j = 0; j < height/patternSeperationY+1; j++){
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
  
  int x = 0;
  int y = 0;
  int x2 = 0;
  int y2 = 100;
  float r = 10;
  float g = 60;
  float b = 145;
  for (int i=0;i<3;i++){
    for(int j=0;j<25;j++){
      stroke(r,g,b,120);
      line(x,y,x2,y2);
      x2 = x2+4;
      r = r - 5.4;
      g--;
    }
    x = x+50;
    x2 = 0;
  }
  x=0;
  x2=100;
  y=0;  
  y2=0;
  for (int i=0;i<50;i++){
    stroke(2,134,115,150);
    line(x,y,x2,y2);
    y = y+2;
    y2 = y2+2;
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

