
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 40;
int patternSeperationY = 40;


void setup(){
  size(500,500);
  smooth();
  
  //the white box simply shows you the space your pattern gets drawn in
  //fill(0);
 // noStroke();
  //rect(0,0,patternSeperationX,patternSeperationY);
  //stroke(0);
  
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
  
  fill(70,134,74);
  line(0,0,40,10);
  line(0,20,40,10);
  line(20,0,20,40);
  line(0,20,40,30);
  line(0,40,40,30);
  ellipse(20,20,10,33);
  ellipse(20,20,30,10);
  fill(200,60,10,80);
  rect(10,20,10,20);
  
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

