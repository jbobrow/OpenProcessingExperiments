
///////////////////////////////////////////////
/// Written by Levi Berge, 4th March 2011   ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,500);
  smooth ();
  
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
  
  

noStroke();
colorMode(RGB, 100);
for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    stroke(i, j, 100);
    point(i, j);
  }
}

  //line(0,0,50,50);
  //line(0,50,50,0);
    
 fill(0, 0, 0);
 
 
noStroke();
quad(70, 30, 60, 50, 70, 70, 50, 50);
quad(30, 30, 50, 50, 30, 70, 40, 50);
quad(70, 70, 50, 50, 30, 70, 50, 60);
quad(30, 30, 50, 50, 70, 30, 50, 40);


  
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

