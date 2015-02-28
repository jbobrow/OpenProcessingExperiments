
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,500);
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
background(78,50,124);
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

fill(0,0,0);
ellipse(50,50,70,70);
fill(34,47,185);
ellipse(50,50,60,60);
fill(0,0,0);
ellipse(50,50,20,20);

strokeWeight(5);   // Thicker

line(100,0,0,100);

strokeWeight(1);   // Default

line(50,0,50,100);
line(60,0,60,100);
line(40,0,40,100);

line(0,50,100,50);
line(0,40,100,40);
line(0,60,100,60);
line(0,0,100,100);
line(-10,0, 90, 100);
line(0,-10,110,100);



  
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

