
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = (100);
int patternSeperationY = (100);


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

strokeWeight(3);
fill(255,200);
line(10,90,50,50);
line(90,10,50,50);

fill(100,200,40);
ellipse(50,50,30,30); 
ellipse(10,90,10,10);
ellipse(90,10,10,10);

fill(250,200,100);
rect(50,50,40,40);
rect(10,10,40,40);

fill(0,100,200);
rect(60,60,30,30);
rect(10,10,30,30);

fill(50,255,100,300);
ellipse(25,24,10,10);
ellipse(74,75,10,10);

ellipse(50,50,20,20);
ellipse(50,50,10,10);



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

