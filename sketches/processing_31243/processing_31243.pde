
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,500);
  

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
  
  fill(255,255,255,30);

  ellipse(50,50,80,80);

  quad(38, 31, 86, 20, 69, 63, 30, 76);
  
  //quad(-38, 31, -86, 20, -69, 63, -30, 76);
  int x = 100;
  int y = 100;
  
  quad(-38+x, 31, -86+x, 20, -69+x, 63, -30+x, 76);


  fill(0,0,0,20);
  ellipse(50,50,90,90);

  fill(255,255,255,80);
  quad(68, 41, 96, 30, 49, 63, 50, 96);
  quad(-68+x, 41, -96+x, 30, -49+x, 63, -50+x, 96);
 
 
  quad(-68+x, -41+y, -96+x, -30+y, -49+x, -63+y, -50+x, -96+y);
  quad(68, -41+y, 96, -30+y, 49, -63+y, 50, -96+y);





  
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

