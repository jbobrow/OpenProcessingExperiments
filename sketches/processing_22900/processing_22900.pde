
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,500);
  smooth();
  background(193,10,37);
  
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  
  noStroke();
  // rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  
  for(int i = -2; i < width/patternSeperationX; i++){
      for(int j = -2; j < height/patternSeperationY; j++){
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


void yourFunction() {
strokeWeight(8);
stroke(41,35,35,90);
arc(50, 55, 50, 50, 0, PI/2);
noFill();
arc(50, 55, 60, 60, PI/2, PI);
arc(50, 55, 70, 70, PI, TWO_PI-PI/2);
arc(50, 55, 80, 80, TWO_PI-PI/2, TWO_PI);
fill(257,68,38,100);
ellipse(20,20,25,25);
}


 
  
 
  
  //ellipse(40,40,20,20);}


//-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  




void keyPressed() {
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}

