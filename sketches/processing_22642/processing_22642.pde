
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
fill(0, 126, 255, 102);
ellipse(50,50,160,160);
fill(255);
ellipse(50,50,140,140);
fill(0, 126, 255, 102);

ellipse(50,50,120,120);
fill(255);
ellipse(50,50,100,100);
fill(0, 126, 255, 102);

ellipse(50,50,80,80);
fill(255);
ellipse(50,50,60,60);
fill(0, 126, 255, 102);

ellipse(50,50,40,40);
fill(255);
ellipse(50,50,20,20);

rect(10,10,100,100);
fill(0, 126, 255, 102);

ellipse(50,50,80,80);
ellipse(50,50,60,60);
fill(255);
ellipse(50,50,40,40);
rect(0,0,500,100);

fill(255);
ellipse(100,100,180,180);
fill(0, 126, 255, 102);
ellipse(100,100,160,160);
fill(255);
ellipse(100,100,140,140);
fill(0, 126, 255, 102);
ellipse(100,100,120,120);
fill(255);
ellipse(100,100,100,100);


stroke(0, 126, 255, 102);



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

