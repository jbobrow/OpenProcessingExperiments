
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup() {
  size(500,500);

  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);

  for(int i = 0; i < width/patternSeperationX; i++) {
    for(int j = 0; j < height/patternSeperationY; j++) {
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

  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  
  noStroke();
  fill(255,255,255);
  rect(0,0,100,100);
  fill(255,0,0);
  rect(0,0,50,50);
  fill(0,102,204);
  rect(50,0,50,50);
  fill(255,255,51);
  rect(0,50,50,50);
  fill(102,255,51);
  rect(50,50,50,50);
  stroke(0);
  strokeWeight(3);
  noFill();
  rect(25,18,20,10);
  rect(45,8,30,20);
  rect(75,18,10,20);
  rect(15,28,20,20);
  rect(35,28,20,20);
  rect(55,28,20,10);
  rect(55,38,30,20);
  rect(25,48,30,20);
  rect(55,58,20,20);
  rect(75,58,20,20);
  rect(15,68,20,10);
  rect(15,78,20,20);
  rect(35,68,20,30);
  rect(55,78,30,20);

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


