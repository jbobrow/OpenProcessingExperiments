
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 50;
int patternSeperationY = 50;


void setup(){
  size(500,500);
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  rect(0,0,500,500);
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
  
  for(float z=0; z<55; z+=5){
    stroke(10,5,0, 50);
    noFill();
    arc(25, 25, z, z, 0, PI/2);
    arc(0, 0, z, z, 0, PI/2);
    arc(25, 50, z, z, PI, TWO_PI-PI/2);
    arc(50, 25, z, z, PI, TWO_PI-PI/2);
   
  stroke(220,200,0,100);
  //top left origin
  line(0,0,50,z);
  stroke(255,255,0,100);
  //top right origin
  line(50,0,0,z);
  stroke(255,255,0,100);
  //bottom left origin
  line(0,50,50,z);
  stroke(220,200,0,100);
  //bottom right origin
  line(50,50,0,z);
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

