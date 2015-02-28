
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,500);
  smooth();
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j <= height/patternSeperationY; j++){
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
  
 

strokeWeight(3);

arc(100,25, 100, 100, PI+0.52, TWO_PI-PI/2);
arc(0,25, 100, 100, TWO_PI-PI/2, TWO_PI-0.52);

arc(100,25, 80, 80, PI+0.52, TWO_PI-PI/2);
arc(0,25, 80, 80, TWO_PI-PI/2, TWO_PI-0.52);

arc(100,25, 60, 60, PI+0.52, TWO_PI-PI/2);
arc(0,25, 60, 60, TWO_PI-PI/2, TWO_PI-0.52);

arc(100,25, 40, 40, PI+0.52, TWO_PI-PI/2);
arc(0,25, 40, 40, TWO_PI-PI/2, TWO_PI-0.52);

arc(100,25, 20, 20, PI+0.52, TWO_PI-PI/2);
arc(0,25, 20, 20, TWO_PI-PI/2, TWO_PI-0.52);

////////////////////////////////////////////

arc(50,50, 97, 100, PI, TWO_PI);

arc(50,50, 80, 80, PI, TWO_PI);

arc(50,50, 60, 60, PI, TWO_PI);

arc(50,50, 40, 40, PI, TWO_PI);

arc(50,50, 20, 20, PI, TWO_PI);

///////////////////////////////////////////

arc(100,75, 100, 100, PI, TWO_PI-PI/2);
arc(0,75, 100, 100, TWO_PI-PI/2, TWO_PI);

arc(100,75, 80, 80, PI, TWO_PI-PI/2);
arc(0,75, 80, 80, TWO_PI-PI/2, TWO_PI);

arc(100,75, 60, 60, PI, TWO_PI-PI/2);
arc(0,75, 60, 60, TWO_PI-PI/2, TWO_PI);

arc(100,75, 40, 40, PI, TWO_PI-PI/2);
arc(0,75, 40, 40, TWO_PI-PI/2, TWO_PI);

arc(100,75, 20, 20, PI, TWO_PI-PI/2);
arc(0,75, 20, 20, TWO_PI-PI/2, TWO_PI);

////////////////////////////////////////////

arc(50,100, 97, 100, PI, TWO_PI);

arc(50,100, 80, 80, PI, TWO_PI);

arc(50,100, 60, 60, PI, TWO_PI);

arc(50,100, 40, 40, PI, TWO_PI);

arc(50,100, 20, 20, PI, TWO_PI);

/////////////////////////////////////////////


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

