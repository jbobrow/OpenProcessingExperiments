
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
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  background(250,252,196);
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

strokeWeight(5);
stroke(255);
line(1,0,1,500);
line(0,18,500,18);
line(0,44,500,44);
strokeWeight(1);
stroke(252,246,117);
line(1,0,1,500);
line(0,18,500,18);
line(0,44,500,44);
noStroke();
fill(219,219,219);
ellipse(25,20,25,50);
fill(255);
ellipse(25,20,15,45);
fill(170,170,170,80);
ellipse(25,20,50,25);
fill(255,80);
ellipse(25,20,40,15);
fill(0,0,0,80);
ellipse(25,20,25,10);
fill(0,0,0,80);
ellipse(25,20,10,25);






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

