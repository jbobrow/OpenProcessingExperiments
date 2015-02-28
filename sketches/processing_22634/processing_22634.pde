
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
fill(200, 80, 80);
rect(0,0,10,100);
fill(210,100,110);
rect(10,0,20,100);
fill(220,120,120);
rect(20,0,30,100);
fill(230,140,130);
rect(30,0,40,100);
fill(240,160,140);
rect(40,0,50,100);
fill(250,180,160);
rect(50,0,60,100);

fill(240,160,140);
rect(60,0,70,100);
fill(230,140,130);
rect(70,0,80,100);
fill(220,120,120);
rect(80,0,90,100);
fill(200,80,80);
rect(90,0,100,100);




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

